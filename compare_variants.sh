
#use rtg (real time genomics) vcf eval tool
#pass in all sample ids as commandline arg 1
/share/apps/rtg-distros/rtg-tools-3.8.4/rtg vcfeval \
-b "190326_M02641_0195_000000000-CCBPG_filtered_annotated_roi_custom.vcf.gz" \
--bed-regions "IlluminaTruSightCancer_CustomROI_b37.bed" \
-c "190415_NB551415_0015_AHKMFTAFXY_filtered_annotated_roi_custom.vcf.gz" \
-o "RTG""_$1" \
-t /data/db/human/gatk/2.8/b37/human_g1k_v37-SDF \
--sample "$1"