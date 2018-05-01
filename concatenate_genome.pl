#!/usr/bin/perl

my $usage = "concatenate_genome.pl reference_file.fasta > concatenated_file.fasta\n\nThis script takes a FASTA formatted file and creates a reference genome\nby concatenating all fragments into one superchromosome, placing\n200bp NNNN inserts between sequences. Useful for TASSEL and other SNP calling\nor GBS-related software. Note that the genome will not be suitable for any\nkind of linkage mapping study, as the order of the sequences inside the\nfake chromosome will be random.\n\n";

unless ($#ARGV == 0) {
    die $usage;
}

my $superchr;

open (READ, $ARGV[0]);
while (<READ>) {
    chomp;
    if (/>/) {
	$superchr .= ("N"x200);
    }
    else {
	$superchr .= $_;
    }
}
close READ;

#$superchr =~ s/^N+//;

print ">chr1\n";
while ($superchr =~ m/(.{1,80})/g) {
    print $1, "\n";
}
