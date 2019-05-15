# filter out non pass variants that would not appear in database- variant level filtration
# drop NTC from vcf as well

vari="$1"
output=${vari%.*}

/share/apps/jre-distros/jre1.8.0_131/bin/java -jar /share/apps/GATK-distros/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar \
SelectVariants \
-R /data/db/human/gatk/2.8/b37/human_g1k_v37.fasta \
-V "$vari" \
--exclude-filtered \
--exclude-sample-name "NTC" \
-O "$output""_pass.vcf"
