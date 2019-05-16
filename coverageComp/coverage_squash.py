import os
import sys
import pandas as pd



sample_dictionary_full = {}
sample_dictionary_mean = {}


#create required dataframes per target
with open("../unique_files.txt") as sample_list:
    tsv_file = ("/Users/sararey/Desktop/mean_coverage_by_gene/" + (sample_list.readline()).rstrip() + ".tsv")
    data_frame = pd.read_csv(tsv_file, sep="\t", header=None)
    # sample_dictionary[sample.rstrip()] = data_frame
    target_names = data_frame[3]

for numb, entry in enumerate(target_names):
    miseq_data = []
    nextseq_data = []
    with open("../unique_files.txt") as sample_list:
        for sample in sample_list:
            tsv_file = ("/Users/sararey/Desktop/mean_coverage_by_gene/" + sample.rstrip() + ".tsv")
            data_frame = pd.read_csv(tsv_file, sep="\t", header=None)
            miseq_data.append(data_frame[7][numb])
            nextseq_data.append(data_frame[16][numb])
    sample_dictionary_full[entry] = (miseq_data,nextseq_data)
    miseq_dataframe = pd.DataFrame(miseq_data)
    nextseq_dataframe = pd.DataFrame(nextseq_data)
    miseq_mean = miseq_dataframe.mean().round(decimals=2)
    nextseq_mean = nextseq_dataframe.mean().round(decimals=2)
    #miseq_mean = miseq_mean.astype(str)
    #nextseq_mean = nextseq_mean.astype(str)
    sample_dictionary_mean[entry] = (miseq_mean, nextseq_mean)

#print(sample_dictionary_full)
#print(sample_dictionary_mean)

with open("/Users/sararey/Desktop/mean_coverage_by_gene/summary.tsv", "w") as of:
    for k in sample_dictionary_mean.keys():
        dat = [k, (str(sample_dictionary_mean.get(k)[0][0])), str(sample_dictionary_mean.get(k)[1][0])]
        formatted = "\t".join(dat)
        of.write(formatted + "\n")




'''
running_total_miseq = running_total_miseq + float(line.rstrip().split("\t")[7])
running_total_nextseq = running_total_nextseq + float(line.rstrip().split("\t")[16])
print(running_total_miseq)

data_frame = pd.read_csv(tsv_file, sep="\t",header=None)
#sample_dictionary[sample.rstrip()] = data_frame
target_names = data_frame[3]
target_names2 = data_frame[3]
headers = target_names+target_names2
print(headers)
'''

        
#print(sample_dictionary)




