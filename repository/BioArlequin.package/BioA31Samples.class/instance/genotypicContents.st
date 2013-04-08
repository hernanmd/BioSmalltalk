accessing - files
genotypicContents

	^ '[Profile]

	Title="A sample of genotypic data"

		NbSamples=1
		GenotypicData=1
		#The gametic phase is unknown, this involves the E.M. Algorithm for the estimation
		#of haplotypic frequencies
		GameticPhase=0
		DataType=STANDARD
		#Setting the locus separator to none for standard data implies that each character 
		#is an allele at a different locus
		LocusSeparator=NONE
		MissingData="?"


[Data]

	[[Samples]]

		SampleName= "An example of STANDARD Data"
		#3 loci are defined as LocusSeparator is set to NONE
		SampleSize=11
		SampleData={
10 1 ESC
     OPP
11 1 FGM
     FBM
12 1 OPP
     SPO
13 1 OPC
     FBR
14 1 FBN
     HBL
15 1 HGJ
     FGN
16 1 FBI
     HBL
17 1 SPO
     ESM
18 1 ESC
     SPE
19 1 KPM
     OPP
20 1 FFN
     INE
}'