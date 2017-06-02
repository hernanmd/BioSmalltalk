accessing
infoFields

	^ Dictionary new 
		at: 'AA' put: 'ancestral allele';
		at: 'AC' put: 'allele count in genotypes, for each ALT allele, in the same order as listed';
		at: 'AF' put: 'allele frequency for each ALT allele in the same order as listed: use this when estimated from primary data, not called genotypes';
		at: 'AN' put: 'total number of alleles in called genotypes';
		at: 'BQ' put: 'RMS base quality at this position';
		at: 'CIGAR' put: 'cigar string describing how to align an alternate allele to the reference allele';
		at: 'DB' put: 'dbSNP membership';
		at: 'DP' put: 'combined depth across samples, e.g.  DP=154';
		at: 'END' put: 'end position of the variant described in this record (for use with symbolic alleles)';
		at: 'H2' put: 'membership in hapmap2';
		at: 'H3' put:  'membership in hapmap3';
		at: 'MQ' put: 'RMS mapping quality, e.g.  MQ=52';
		at: 'MQ0' put: 'Number of MAPQ == 0 reads covering this record';
		at: 'NS' put: 'Number of samples with data';
		at: 'SB' put: 'strand bias at this position';
		at: 'SOMATIC' put: 'indicates that the record is a somatic mutation, for cancer genomics';
		at: 'VALIDATED' put: 'validated by follow-up experiment';
		at: '1000G' put: 'membership in 1000 Genomes';
		yourself