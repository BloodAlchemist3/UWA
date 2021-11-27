#!bin/bash
#get user time selection
echo what file date should be referenced?
read date
echo "file to be checked is ${date}_Dealer_schedule"

#get user time selection
echo 'what times should be referenced ?'
read time1
echo "AM/PM?"
read AMPM
#grep the specified Dealer_schedule file and export
grep -E $time1.*$AMPM ${date}_Dealer_schedule > step1.txt

#awk the output in Test.txt to isolate roulette dealer only
step2=$(awk '{print $1; print $2; print $5; print $6}' step1.txt)
echo $step2
rm step1.txt
