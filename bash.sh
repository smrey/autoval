> Desktop/all_files.txt; for i in $(ls Desktop/tmp/*gene*); do echo $i | cut -d'_' -f5 >> Desktop/all_files.txt; done
cat Desktop/all_files.txt | sort | uniq > Desktop/unique_files.txt