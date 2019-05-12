import os
import sys

orig_path = "/Users/sararey/Desktop/tmp/"
pth = os.path.join(orig_path)

dir_list = os.listdir(pth)
# make list of sample ids
for i in dir_list:
    if i.find("gene") > 0:
        print (i)
        print(i.split("_")[4])

miseq_cov = "190326_M02641_0195_000000000-CCBPG_11M01274_gene_coverage" #sys.argv[1]
nextseq_cov = "190415_NB551415_0015_AHKMFTAFXY_11M01274_gene_coverage" #sys.argv[2]

miseq_cov_path = os.path.join(pth, miseq_cov)
nextseq_cov_path = os.path.join(pth, nextseq_cov)

with open(miseq_cov_path) as msc:
    with open(nextseq_cov_path) as nsc:
        print(msc)

