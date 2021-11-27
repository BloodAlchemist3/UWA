#!bin/bash
#get user time selection
echo what file date should be referenced?
read date
echo "file to be checked is ${date}_Dealer_schedule"

#get user time selection
echo 'what time should be referenced enter as hh?'
read time1
echo "AM or PM? (case insensitive)"
read AMPM
#grep the specified Dealer_schedule file and export
grep -i  -E $time1.*$AMPM ${date}_Dealer_schedule > test.txt
echo 'what game should be checked? 1=Black Jack, 2= Roulette, 3= Texas'
read game

if [ $game -eq 1 ]; then awk '{print $1; print $2; print $3; print $4}' test.txt > test1.txt;
elif [ $game -eq 2 ]; then awk '{print $1; print $2; print $5; print $6}' test.txt > test1.txt;
elif [ $game -eq 3 ]; then awk '{print $1; print $2; print $7; print $8}' test.txt > test1.txt; 
fi


cat test1.txt
rm test.txt
rm test1.txt
#test files are created to aid in troubleshooting.
#the two steps each can produce their own file to aid in verifying function of each step


