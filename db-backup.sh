#!/bin/bash -x
mysql_user=""
mysql_password=""
mysql_db_name=""
company_name=""
backup_path=""

sqlex_user=""
sqlex_pw=""

ssh_login=""
ssh_pw=""
ssh_srv=""

ftp_srv=""

echo "ROZPOCZĘCIE PROCEDURY KOPII ZAPASOWEJ..."

#MySQL

echo "Baza danych MySQL..."

sudo mysqldump -u $mysql_user --password=$mysql_password --single-transaction --quick --all-databases > $backup_path/mysql/$company_name-$(date +%Y%m%d).sql
sudo gzip $backup_path/mysql/$company_name-$(date +%Y%m%d).sql

echo "MySQL - koniec"

#MSSQLExpress

echo "Baza danych SQLExpress..."

sudo docker exec SQLExpress /opt/mssql-tools/bin/sqlcmd -b -V16 -S localhost -U $sqlex_user -P $sqlex_pw -Q "BACKUP DATABASE [company_name_PLATNIK] TO DISK = N'/var/opt/mssql/backups/company_name_PLATNIK.bak' with NOFORMAT, NOINIT, NAME = 'company_name_PLATNIK-full', SKIP, NOREWIND, NOUNLOAD, STATS = 10"
sudo docker cp SQLExpress:/var/opt/mssql/backups/%{company_name}_PLATNIK.bak $backup_path/SQLExpress/%{company_name}_PLATNIK-$(date +%Y%m%d).bak
sudo gzip $backup_path/SQLExpress/%{company_name}_PLATNIK-$(date +%Y%m%d).bak

echo "SQLExpress - koniec"


#MegaFakturka

echo "Baza danych MegaFakturka..."

sudo cp /home/fakturka/FakturkaKOAG/fakturka.mdb $backup_path/MegaFakturka/fakturka-$(date +%Y%m%d).mdb
sudo gzip $backup_path/backup/MegaFakturka/fakturka-$(date +%Y%m%d).mdb

echo "MegaFakturka - koniec"

#Transfer

echo "Transfer do krypty 1..."

#rsync
 sudo sshpass -p $ssh_pw rsync -arP -e "ssh -p 21212" $backup_path $ssh_login@$ssh_srv:/home/%company_name/

echo "Krypta 1 - koniec"
echo "Transfer do krypty 2..."

#wput
sudo wput --basename=$backup_path $backup_path  ftp://$ftp_login:"password"@$ftp_srv/%company_name/

echo "Krypta 2 - koniec"
echo "Czyszczenie..."

#clear
sudo rm $backup_path/MySQL/*.*
sudo rm $backup_path/SQLExpress/*.*
sudo rm $backup_path/MegaFakturka/*.*
docker exec SQLExpress rm /var/opt/mssql/backups/${company_name}_PLATNIK.bak

echo "ZAKOŃCZONO"
echo "ZALECA SIE WERYFIKACJĘ PLIKÓW KOPII ZAPASOWEJ UMIESZCZONYCH W KRYPTACH"
