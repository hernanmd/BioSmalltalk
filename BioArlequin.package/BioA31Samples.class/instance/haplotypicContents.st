accessing - files
haplotypicContents

	^ '[Profile]
	Title="A small example of microsatellite haplotypic data"

		NbSamples=2
		#Compare the global Fst value obtained with AMOVA and 
		#the pairwise Fst value obtained through the Population Pairwise Fst
		GenotypicData=0
		DataType=MICROSAT
		LocusSeparator=WHITESPACE
		#We compute the distance matrix internally based on the composition of the haplotypes
		MissingData=''?''

[Data]

[[Samples]]

	#1
	SampleName="MICR1"
	SampleSize=28
	SampleData=	{
		1	27  123  134
		40	1   125  132
}
	#2
	SampleName="MICR2"
	SampleSize=59
	SampleData=	{
		2	37  123  134
		17	1   125  140
		6	21  130  128
}

[[Structure]]

		StructureName="Test structure"
		NbGroups=1
		Group={
			"MICR1"
			"MICR2"
      }'	