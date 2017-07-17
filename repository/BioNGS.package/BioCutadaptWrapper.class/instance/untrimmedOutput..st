properties
untrimmedOutput: aFilename
	" Write all reads without adapters to FILE (in FASTA/FASTQ format) instead of writing them to the regular output file "

	self propertySeparator: Character space.
	self propertyAt: 'untrimmed-output' ifAbsentPut: [ aFilename ]