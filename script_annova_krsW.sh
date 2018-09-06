rm -f anova_tmp* result*
var=$(wc -l < $1)
i=1

while [ "$i" -le "$var" ]; do
  echo "line no:" "$i"
	
	tmp=$(awk 'NR=="'$i'"{print $0}' $1 | cut -f2- | sed 's/\t/,/g')
	name=$(awk 'NR=="'$i'"{print $0}' $1 | cut -f1)
	sed 's/XXX/'$tmp'/g' anova.R > anova_tmp.R
	chmod +x anova_tmp.R
	R CMD BATCH anova_tmp.R
	tt=$(grep Df -A1 anova_tmp.Rout | tail -1 | awk '{print $2"\t"$5"\t"$6}')
	tt1=$(grep chi-squared anova_tmp.Rout | cut -d"," -f3)
	echo -e $name'\t'$tt'\t'$tt1 >> result_"$1"
	rm -f anova_tmp.R
	rm -f anova_tmp.Rout
  i=$(($i + 1))
done
