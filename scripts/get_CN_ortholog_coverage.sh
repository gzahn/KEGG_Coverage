#!/bin/bash
set -ueo pipefail


# pathways file and kegg list file
PATHWAYS=$2
KEGGLIST=$1
SAMPLEID=$(basename ${1/_ko.tsv//})


while read pathway
do
# download with wget
#https://www.genome.jp/dbget-bin/get_linkdb?-t+orthology+path:map00910

if ! [ -f $pathway.paths ]; then
wget $(echo https://www.genome.jp/dbget-bin/get_linkdb?-t+orthology+path:map$pathway) -O $pathway.paths
fi

# extract KO orthologs
# search for KO orthologs in ko.tsv file
# count occurrences
# send to file (name file based on $pathway)
grep -Fwf <(cat $pathway.paths | cut -d ">" -f2 | cut -d "<" -f1 | grep "^K") $KEGGLIST | cut -f 3 | sort | uniq -c > $SAMPLEID.$pathway.coverage

done < $PATHWAYS

cat $SAMPLEID*.coverage | sort -k 2 -u > $SAMPLEID.combined_coverage.txt
