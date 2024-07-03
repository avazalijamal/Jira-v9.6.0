echo "Jira Yüklənməsi Başladı"
printf "\n"

echo "Addım 1: Sistem Tələblərinin Yoxlanılması və Yenilənməsi"
printf "\n"
sudo apt-get update

printf "\n\n\n"
echo "Addım 2: Verilənlər Bazasının Quraşdırılması"
printf "\n"
sudo apt-get install postgresql postgresql-contrib -y
sudo update-rc.d postgresql enable
sudo service postgresql start

printf "\n\n\n"
echo "PostgreSQL-in İçərisində Bu Kodları Sətir-Sətir yazıb ENTER Vurun"
printf "\n"
echo "CREATE USER jiradbadmin WITH PASSWORD 'password';"
echo "CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;"
echo "GRANT ALL PRIVILEGES ON DATABASE jiradb TO jiradbadmin;"
echo "\q"

printf "\n\n\n"
sudo -u postgres psql

printf "\n\n\n"
echo "Addım 3: Jira Software-nin Yüklənməsi və Quraşdırılması"
printf "\n"
wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-9.6.0-x64.bin
chmod a+x atlassian-jira-software-9.6.0-x64.bin
sudo ./atlassian-jira-software-9.6.0-x64.bin

printf "\n\n\n"
echo "Addım 4: Crack Etmək Üçün Lazımi Mühitin Hazırlanması"
printf "\n"
cd /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
sudo rm -f atlassian-extras-3.4.6.jar
sudo wget https://github.com/avazalijamal/Jira-v9.6.0/blob/master/atlassian-extras-3.4.6.jar
# sudo wget https://github.com/guywiththecrack/jira-crack/blob/master/atlassian-extras-3.4.6.jar
pwd

printf "\n\n\n"
echo "Addım 5: Jira-nın Konfiqurasiya Edilməsi"
printf "\n"
cd /opt/atlassian/jira/bin/
sudo ./start-jira.sh
sudo ./stop-jira.sh
sudo ./start-jira.sh

printf "\n\n\n"
echo "Activ Etmək Üçün Lisenziya Açarı"
printf "\n"
echo "AAAB+g0ODAoPeJyNU12PojAUfedXkOzjBmzRwY+kySriyIo6DrCT9a3iVTrD17bFGffXLwhmPjRmE15o7zn3nHNvv3lFqg5zrmKkImOA+wNkqoFvqQYyDGXPAdIoy3PgustCSAX4xxwWNAFiLedz+9Fyhq5icaCSZemYSiAVUEMdDSPlBmQMIuQsr1AkSGOWMAlbNa4B6uaoRlLmYtBq/Y1YDDrLlDllqYSUpiHYbznjx6Zbr6+hbvkpz4zTs0p7y2rqhevMHd8eK4si2QBf7gIBXBANn8Xd4Mp5ti1CqVc/msh28pVy0C+IbtTSULIDEMkL+JTlx/Mb8FIVtaB0zevSJp5fZePKnKF4xeY9xlOJfaBxcRoG2dFYNPRfiZZ8T1Mm6roq6TJo3G/ruIN1bJg6xr1BDyGsWFkqS7F2GX5MhJ7oz/RAt6y8+rFPyjM9zJK6xUUsjdgpFRGZW8iarKxJ27v/zhLjPnl9Sqcrx/Lcdb4wZv31ygmmeBYf//xOWiNv7XaXuwhPneDhpZV1Ealb/GdqnqS8clr7b8bsjInrjD17obnY7PTv7rq4Y5oIf9qaa4vqAT8AL+Gj0ZOtIfcn1oKlMdEc358pL3A8DwObCHVRr93G117N5T4+FDyMqICvb+Yj+DSxnDPRmC7lkysWmiGdlI+G/j+VCElqMCwCFGxrnjz1G0V5MDwiLbn3gPiP6BUqAhRxlZk+6MN8sZsehGcEYqlhbQxMyg==X02o0"
printf "\n\n\n"

echo "Jira Yüklənməsi Bitdi"
printf "\n"