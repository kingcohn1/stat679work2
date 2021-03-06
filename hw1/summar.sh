echo analysis,Hmax,CPU > output.csv
for i in log/*.log;
do
	echo "i=$i" 
	analysis=$(echo $i | grep -o -E "[^/]+\.log" | grep -o -E "[^.log]+")
	h=$(grep "hmax" $i | head -n1 | grep -o -E "[0-9]")
	CPU=$(grep -E "Elapsed time. [[:digit:]]" -o out/$analysis.out)	
	echo "analysis=$analysis ; h=$h ; CPU=$CPU "
    echo "$analysis,$h,$CPU,$xtolAbs" >> output.csv	
done
