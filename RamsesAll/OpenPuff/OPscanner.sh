#!/bin/bash

IFS=$'\n'
for line in $(< /tmp/tmp1); do

	echo $line | sed 's/.*(\(.*\))/\1/' >>/tmp/tmp2

done

for line in $(< /tmp/tmp2); do
printf "%d\n" $line >> /tmp/tmp3
done 
pvar=0
nvar=0
IFS=$'\n' 
for line in $(< /tmp/tmp3); do
	
	result=$(echo $line)
	if [[ $result -gt 0 ]]; then		
	pvar=$((pvar+1))
	else
	nvar=$((nvar+1))
	echo -n "" >/tmp/tmp2
	echo -n "" >/tmp/tmp3
fi
done
	echo $pvar
	echo $nvar
	if [[ $pvar -gt $nvar ]]; then

	echo -e \ "${file}" "Flag test - Modified flags, OpenPuff Steganography detected " $pvar $nvar >> /home/ts424/Desktop/Ramses/Results/OpenPuff.txt
	else
	echo -e \ "${file}" "Flag Test - No modified flags found" $pvar $nvar >> /home/ts424/Desktop/Ramses/Results/Negatives; source /home/ts424/Desktop/Ramses/RamsesAll/EOF/EOFScanner.sh
	pvar=0
	nvar=0
fi 



