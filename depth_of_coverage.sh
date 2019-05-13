
bahm=$(find $1 -name *.bam)
sample=${bahm%.*}

echo $bahm
echo $sample

/share/apps/jre-distros/jre1.8.0_131/bin/java -XX:GCTimeLimit=50 -XX:GCHeapFreeLimit=10 -Djava.io.tmpdir=/state/partition1/tmpdir -Xmx4g -jar /share/apps/GATK-distros/GATK_3.8.0/GenomeAnalysisTK.jar \
-T DepthOfCoverage \
-R /state/partition1/db/human/gatk/2.8/b37/human_g1k_v37.fasta \
-o "$sample"_TSC_DepthOfCoverage \
-I $bahm \
-L IlluminaTruSightCancer_CustomROI_b37.bed \
--countType COUNT_FRAGMENTS \
--minMappingQuality 20 \
--minBaseQuality 10 \
-ct 20 \
--omitLocusTable \
-rf MappingQualityUnavailable \
-dt NONE