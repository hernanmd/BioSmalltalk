properties
tooLongOutput: aFilename
	" Instead of throwing away the reads that are too long according to -M, write them to FILE (in FASTA/FASTQ format). "

	self propertySeparator: Character space.
	self propertyAt: 'too-long-output' ifAbsentPut: [ aFilename ]