#To calculate sensitivity and 95% confidence intervals
#Command line arg- pass in RTG folder generated using rtg vcf eval

rtgdir="$1"

Rscript -e 'args = commandArgs(trailingOnly=TRUE); print(args[1]); rtgd = paste("./",args[1],"/summary.txt", sep=""); df <- read.table(rtgd, skip=2); x <- binom.test(x = as.numeric(df[2,3]), n = (as.numeric(df[2,3]) + as.numeric(df[2,5]))); paste0("sensitivity: ",round(x$estimate, 3)," ",round(x$conf.int[1], 3),"-",round(x$conf.int[2], 3))' "$rtgdir"