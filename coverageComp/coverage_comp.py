import os
import sys

orig_path = "../tmp/"
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

miseq_cov =  sys.argv[1]
nextseq_cov = sys.argv[2]

miseq_cov_path = os.path.join(pth, miseq_cov)
nextseq_cov_path = os.path.join(pth, nextseq_cov)

outfile_name = nextseq_cov_path.split("_")[4] + ".tsv"
#print(outfile_name)

outfile = os.path.join(outpath, outfile_name)

with open(miseq_cov_path) as msc, open(nextseq_cov_path) as nsc, open (outfile, "w") as of:
        for x,y in zip(msc,nsc):
            of.write(x.strip() + "\t" + "\t" + y.strip() + "\n")
        print("Writing file " + outfile_name)




