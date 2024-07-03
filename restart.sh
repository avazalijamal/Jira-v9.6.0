echo "Addım 1: Jira-nın Restart Edilir"
printf "\n"
cd /opt/atlassian/jira/bin/
sudo ./start-jira.sh
sudo ./stop-jira.sh
sudo ./start-jira.sh
printf "\n"
echo "Jira-nın Restart Edildi"
printf "\n"