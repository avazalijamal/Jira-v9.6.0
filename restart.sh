echo "Addım 1: Jira-nın Restart Edilir"
printf "\n"
cd /opt/atlassian/jira/bin/
sudo ./start-jira.sh -fg
sudo ./stop-jira.sh -fg
sudo ./start-jira.sh -fg
printf "\n"
echo "Jira-nın Restart Edildi"
printf "\n"