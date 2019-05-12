import os
import sys

orig_path = "/Users/sararey/Desktop/tmp/"
orig_path = "C:\\Users\\saram\\Documents\\Work\\analysis\\tmp"
pth = os.path.join(orig_path)
outpath = os.path.join( os.path.dirname( __file__ ), '..' )

'''
dir_list = os.listdir(pth)
# make list of sample ids
for i in dir_list:
    if i.find("gene") > 0:
        print (i)
        print(i.split("_")[4])
'''

miseq_cov = "190326_M02641_0195_000000000-CCBPG_11M01274_gene_coverage" #sys.argv[1]
nextseq_cov = "190415_NB551415_0015_AHKMFTAFXY_11M01274_gene_coverage" #sys.argv[2]

outfile_name = nextseq_cov.split("_")[4] + ".tsv"
#print(outfile_name)

miseq_cov_path = os.path.join(pth, miseq_cov)
nextseq_cov_path = os.path.join(pth, nextseq_cov)
outfile = os.path.join(outpath, outfile_name)

with open(miseq_cov_path) as msc, open(nextseq_cov_path) as nsc, open (outfile, "w") as of:
        for x,y in zip(msc,nsc):
            of.write(x.strip() + "," + "," + y.strip() + "\n")
        print("Writing file " + outfile_name)




