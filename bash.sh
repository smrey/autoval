> Desktop/all_files.txt; for i in $(ls Desktop/tmp/*gene*); do echo $i | cut -d'_' -f5 >> Desktop/all_files.txt; done
cat Desktop/all_files.txt | sort | uniq > Desktop/unique_files.txt

for i in $(cat unique_files.txt); do echo $i; python coverageComp/coverage_comp.py tmp/*"-CCBPG"*$i"gene" tmp/*"TAFXY"*$i"gene"; done

for i in $(cat ../unique_files.txt); do echo $i; python coverage_comp.py ../tmp/*"-CCBPG"*$i"gene" ../tmp/*"TAFXY"*$i"gene"; done

for i in $(cat ../unique_files.txt); do echo $i; miseq=$(find .. -maxdepth 3 -name *"-CCBPG"*$i*"gene"*); nextseq=$(find .. -maxdepth 3 -name *"TAFXY"*$i*"gene"*); python coverage_comp.py $miseq $nextseq ; done

for i in $(cat ../unique_files.txt); do echo $i; miseq=$(find .. -maxdepth 3 -name *"-CCBPG"*$i*"custom"*); nextseq=$(find .. -maxdepth 3 -name *"TAFXY"*$i*"custom"*); python coverage_comp.py $miseq $nextseq ; done


