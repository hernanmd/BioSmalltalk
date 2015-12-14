properties
inSeqFile: aFileReference 
	" Set Input sequence file in FASTA format to be aFileReference "

	self propertyAt: 'I' ifAbsentPut: [ aFileReference ]