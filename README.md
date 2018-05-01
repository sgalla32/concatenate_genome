Script takes a FASTA formatted file and creates a reference genome by concatenating all fragments into one superchromosome, placing 200bp NNNN inserts between sequences. Useful for TASSEL and other SNP calling or GBS-related software. Note that the genome will not be suitable for any kind of linkage mapping study, as the order of the sequences inside the fake chromosome will be random.

To use, "concatenate_genome.pl reference_file.fasta > concatenated_file.fasta"
