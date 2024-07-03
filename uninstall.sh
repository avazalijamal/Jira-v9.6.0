echo "Jira Silinməsi Başladı"
printf "\n"

echo "Addım 1: Jira-nı Dayandırmaq"
sudo /opt/atlassian/jira/bin/stop-jira.sh

printf "\n\n\n"
echo "Addım 2: Jira Qovluqlarını Silmək"
sudo rm -rf /opt/atlassian
sudo rm -rf /var/atlassian/application-data

printf "\n\n\n"
echo "Addım 3: PostgreSQL Verilənlər Bazasını Silmək"
echo "PostgreSQL-in İçərisində Bu Kodları Sətir-Sətir yazıb ENTER Vurun"
printf "\n"
echo "DROP DATABASE jiradb;"
echo "DROP USER jiradbadmin;"
echo "\q"

printf "\n\n\n"
sudo -u postgres psql

printf "\n\n\n"
echo "Addım 4: Qalan Konfiqurasiya Fayllarını Yoxlamaq"
sudo rm -rf /var/log/atlassian
printf "\n\n\n"

echo "Jira Yüklənməsi Bitdi"
printf "\n"

echo "Sistemi Silinməsi Başlatmaq"
sudo reboot