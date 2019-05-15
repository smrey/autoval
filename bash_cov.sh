


meanOnTargetCoverage=$(head -n2 $seqId"_"$sampleId"_DepthOfCoverage".sample_summary | tail -n1 | cut -s -f3) #avg usable coverage

> mean_depths.csv; for i in $(ls *.sample_summary); do echo $i; j=${i%%.*}; k=${j%_*}; printf $k"," >> mean_depths.csv; tail -n -1 $i | cut -f3 >> mean_depths.csv; done

for i in $( ls *custom*Coverage.txt ); do echo $i; j=${i%_*}; grep allTargets $i > $j"_gene_coverage"; done

> ../median_depths.csv; for i in $(ls *.sample_summary); do echo $i; j=${i%%.*}; k=${j%_*}; printf $k"," >> ../median_depths.csv; head -n2 $i | tail -n -1 | cut -f5 >> ../median_depths.csv; done

bgzip -c file.vcf > file.vcf.gz
tabix -p vcf file.vcf.gz