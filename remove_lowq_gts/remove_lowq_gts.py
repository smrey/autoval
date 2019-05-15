import os
import sys

vcf = sys.argv[1]

pth=os.path.dirname(vcf)
outfile = os.path.join(pth, (os.path.basename(vcf).split(".")[0] + "_final.vcf"))

#create list
outvcf = []

with open(vcf) as vf, open(outfile , "w") as of:
    for x, line in enumerate(vf):
        current_line = line.rstrip().split("\t")
        if not line.startswith("#"):
            if "FT" in (current_line[8]):
                end_of_line = current_line[9:]
                for y, sample in enumerate(end_of_line):
                    if "PASS" not in sample:
                        genotype_field = sample.split(":")
                        genotype_field[0] = "./."
                        sample = ":".join(genotype_field)
                        current_line[9+y] = sample
                print(current_line)
        of.writelines(current_line)
        of.write("\n")