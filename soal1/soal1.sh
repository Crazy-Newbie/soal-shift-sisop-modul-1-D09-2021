#!/bin/bash

#1a
grep -o "[I|E].*" syslog.log

#1b
grep -o "ERROR.*" syslog.log | cut -d "(" -f1 | sort | uniq -c

#1c
grep -o "ERROR.*" syslog.log | cut -d "(" -f2 | cut -d ")" -f1 | sort | uniq -c
grep -o "INFO.*" syslog.log | cut -d "(" -f2 | cut -d ")" -f1 | sort | uniq -c


#1d
modif=$(grep "modified" syslog.log | wc -l)
echo "The ticket was modified while updating," $modif > error_message.txt
deny=$(grep "denied" syslog.log | wc -l)
echo "Permission denied while closing ticket," $deny >> error_message.txt
tried=$(grep "Tried" syslog.log | wc -l)
echo "Tried to add information to closed ticket," $tried >> error_message.txt
timeout=$(grep "Timeout" syslog.log | wc -l)
echo "Timeout while retrieving information," $timeout >> error_message.txt
notexist=$(grep "exist" syslog.log | wc -l)
echo "Ticket doesn't exist," $notexist >> error_message.txt
connection=$(grep "Connection" syslog.log | wc -l)
echo "Connection to DB failed," $connection >> error_message.txt

sort -t, -nr -k2 error_message.txt | sed '1i\Count,Error' > error_message.csv

#1e
echo "Username,INFO,ERROR" > user_statistic.csv
cut -d "(" -f2 syslog.log | cut -d ")" -f1 | sort | uniq |
while read line;
do
	err=$(grep -o "ERROR.*($line)" syslog.log | wc -l)
	inf=$(grep -o "INFO.*($line)" syslog.log | wc -l)
	echo -e "$line,$inf,$err"
done >> user_statistic.csv
