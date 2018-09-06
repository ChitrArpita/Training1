#sed '1d' input_blood.txt > tmp1

for i in {1..3}
do
tmp=$(awk 'NR=="'$i'"{print $0}' tmp1.txt | cut -f4- | sed 's/\t/,/g')
name=$(awk 'NR=="'$i'"{print $0}' tmp1.txt | cut -f1-3)
sed 's/XXX/'$tmp'/g' anova.R > anova_tmp.R
chmod +x anova_tmp.R
R CMD BATCH anova_tmp.R
tt=$(grep Df -A1 anova_tmp.Rout | tail -1 | awk '{print $5"\t"$6}')

echo -e $name'\t'$tt >> test_file
rm -f anova_tmp.R
rm -f anova_tmp.Rout

done
