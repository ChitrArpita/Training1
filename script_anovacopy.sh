#sed '1d' input_blood.txt > tmp1

#for number in {1..2}
#do
tmp=$(awk 'NR=="'$i'"{print $0}' tmp1.txt | cut -f4- | sed 's/\t/,/g')

while read line; do 

tmp=$(echo $line  |cut -f4- | sed 's/\t/,/g')
echo $tmp
sed 's/val/'$tmp'/g' anova.R > anova_tmp.R
chmod +x anova_tmp.R
R CMD BATCH anova_tmp.R
tt=$(grep -w batch anova_tmp.Rout | tail -1)

echo $tt
#rm -f anova_tmp.R

done < tmpnidhan.txt
