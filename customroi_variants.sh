#restrict variants to ROI
#pass name of vcf to script

vcf="$1"
output=${vcf%%.*}

/share/apps/bcftools-distros/bcftools-1.4.1/bcftools view \
-R IlluminaTruSightCancer_CustomROI_b37.bed \
"$vcf" \
-o "$output""_custom.vcf"
