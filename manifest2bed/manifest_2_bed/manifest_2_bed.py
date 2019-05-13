import sys

manifest_file = sys.argv[1]
bed_file = sys.argv[2]

manifest_list = []

with open(manifest_file) as mf:
    for ind, line in enumerate(mf):
        manifest_list.append(line.rstrip())
        if line.startswith("Name"):
            start_bed = ind + 1


with open(bed_file, "w") as bf:
    for entry in manifest_list[start_bed:]:
        split_entry = entry.split("\t")
        chr = split_entry[1]
        start_coord = str(int(split_entry[2])-1)
        end_coord = split_entry[3]
        metadata = split_entry[0]
        bf.write(chr + "\t" + start_coord + "\t" + end_coord + "\t" + metadata + "\n")





