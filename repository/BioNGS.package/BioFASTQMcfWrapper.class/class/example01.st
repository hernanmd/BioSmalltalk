examples
example01

	^ BioFASTQMcfWrapper new
		out: (self fastqcExamplesDir / 'cleanedR1.fq.gz') fullName;
		out: (self fastqcExamplesDir / 'cleanedR2.fq.gz') fullName;
		yourself