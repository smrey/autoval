for i in $( ls ../190415_NB551415_0015_AHKMFTAFXY/IlluminaTruSightCancer/*/ -d); do j=${i%*/}; k=${j%/*}; sample=$(basename $j); echo $sample; zcat $k/$sample/*_DepthOfCoverage.gz | awk '$3>=20{print $1"\t"$2-1"\t"$2}' | /share/apps/bedtools-distros/bedtools-2.26.0/bin/bedtools sort -faidx /data/db/human/gatk/2.8/b37/human_g1k_v37.fasta.fai | /share/apps/bedtools-distros/bedtools-2.26.0/bin/bedtools merge > $k/$sample/"$sample"_20x.bed; done

for i in $( ls ../190326_M02641_0195_000000000-CCBPG/IlluminaTruSightCancer/*/ -d); do j=${i%*/}; k=${j%/*}; sample=$(basename $j); echo $sample; zcat $k/$sample/*_DepthOfCoverage.gz | awk '$3>=20{print $1"\t"$2-1"\t"$2}' | /share/apps/bedtools-distros/bedtools-2.26.0/bin/bedtools sort -faidx /data/db/human/gatk/2.8/b37/human_g1k_v37.fasta.fai | /share/apps/bedtools-distros/bedtools-2.26.0/bin/bedtools merge > $k/$sample/"$sample"_20x.bed; done


for i in $( ls ../190326_M02641_0195_000000000-CCBPG/IlluminaTruSightCancer/*/ -d); do j=${i%*/}; k=${j%/*}; sample=$(basename $j); echo $sample; /share/apps/bedtools-distros/bedtools-2.26.0/bin/bedtools coverage -a $k/$sample/IlluminaTruSightCancer_ClinicalCoverageTargetsHotspots.bed -b $k/$sample/$sample"_20x.bed" > $k/$sample/$sample"_MiSeqCoverage.bed"; done


