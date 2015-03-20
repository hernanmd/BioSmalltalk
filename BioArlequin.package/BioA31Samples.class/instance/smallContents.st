accessing - files
smallContents

	^ '[Profile]

	Title="A small test example with relative frequencies"
	NbSamples=1

		GenotypicData=0
		DataType=STANDARD
		#Setting LocusSeparator to NONE will cause each character
		#to be considered as an allele at a different locus
		LocusSeparator=NONE
		# The frequencies of each individual are given as relative
		# values. The number of occurence of each individual is
		# this frequency multiplied by the SampleSize:
		Frequency=REL

[Data]

	[[Samples]]

		SampleName="Population 1"
		#The sample size is especially important when relative frequencies are entered
		SampleSize=100
		SampleData= { 
			000 0.2  TL
			001 0.3  EI
			002 0.1  GA
			003 0.1  SC
			004 0.05 AH
			005 0.05 CM
			006 0.2  AA 
}'	