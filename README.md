# get_CN_ortholog_coverage.sh

This bash script takes a _ko.tsv annotation file and returns sanely named output files (one for each pathway, as well as a single non-redundant compilation) that contain the counts of all the KEGG orthologs that are part of that KEGG pathway.

It requires a file that is a list of KEGG Pathways (one per line)

In this case, the file ```./paths.txt```

___


Depends on ```wget```

___

## Example

```
# change to output directory
cd out/
# run script from there using input tsv file and the list of KEGG pathways
bash ../scripts/get_CN_ortholog_coverage.sh ../data/Ga0526450_ko.tsv ../paths.txt 
```

___


## Output

See the ```./out``` directory for example output.

File naming follows:

SampleID.KEGGPATHWAY.coverage (flat-file with columns: coverage | KEGG ortholog ID)
```Ga0526450.00910.coverage```

The combined file has redundancies eliminated (some KEGG Orthologs are present in more than one Pathway)
and combines all the pathways

```Ga0526450.combined_coverage.txt```


