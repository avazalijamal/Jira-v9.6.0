echo "Jira Silinməsi Başladı"
printf "\n"

echo "Addım 1: Jira-nı Dayandırmaq"
printf "\n"
sudo /opt/atlassian/jira/bin/stop-jira.sh

printf "\n\n\n"
echo "Addım 2: Jira Qovluqlarını Silmək"
printf "\n"
sudo rm -rf /opt/atlassian
sudo rm -rf /var/atlassian

printf "\n\n\n"
echo "Addım 3: PostgreSQL Verilənlər Bazasını Silmək"
printf "\n"
echo "PostgreSQL-in İçərisində Bu Kodları Sətir-Sətir yazıb ENTER Vurun"
printf "\n"
echo "DROP DATABASE jiradb;"
echo "DROP USER jiradbadmin;"
echo "\q"

printf "\n\n\n"
sudo -u postgres psql

printf "\n\n\n"
echo "Addım 4: Qalan Konfiqurasiya Fayllarını Yoxlamaq"
printf "\n"
sudo rm -rf /var/log/atlassian
printf "\n\n\n"

echo "Jira Yüklənməsi Bitdi"
printf "\n"

echo "Sistemdən `jira` İstifadəçisi və Qrupu Silinir"
sudo userdel -r jira
sudo groupdel jira
compgen -u
compgen -g

echo "Sistemi Silinməsi Başlatmaq"
sudo reboot
