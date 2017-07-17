properties
tooShortOutput: aFilename
	" Instead of throwing away the reads that are too short according to -m, write them to FILE (in FASTA/FASTQ format). "

	self propertySeparator: Character space.
	self propertyAt: 'too-short-output' ifAbsentPut: [ aFilename ]