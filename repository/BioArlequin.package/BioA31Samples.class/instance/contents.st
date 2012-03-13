accessing - files
contents

	^ '# This example is about an AMOVA analysis based on an
# distance matrix given in an external file. The
# haplotypic composition of the haplotypes 
# is thus only used through the distance matrix 
#
# Data source: Excoffier, L., Smouse, P., and Quattro, J., 1992, 
# Analysis of molecular variance inferred from metric distances 
# among DNA haplotypes: Application to human mitochondrial DNA restriction data, 
# Genetics 131:479-491.

[Profile]

	Title="A New Sample File Designed To Compute AMOVA"
	NbSamples=10
	#Haplotypic Data:
	GenotypicData=0
	LocusSeparator=NONE
	DataType=FREQUENCY

[Data]

	[[DistanceMatrix]]
		MatrixName="A matrix of genetic distance between 56 haplotypes"
		MatrixSize= 56
		#LabelPosition=LINE
		MatrixData=EXTERN "amovadis.dis"

	[[Samples]]

		SampleName="Tharu"
		SampleSize=91
		SampleData= {
			1 48 
			8 2
			9 5
			13 23  
			28 2
			47 2
			48 2   
			49 1
			50 1  
			51 1
			52 2
			53 1
			54 1
		}

		SampleName="Oriental"
		SampleSize=46
		SampleData= {
			1 32
			6 1   
			8 2
			9 4
			12 2  
			13 2
			27 1  
			28 1
			29 1  
		}

		SampleName="Wolof"
		SampleSize= 110
		SampleData= {
			1 23
			2 39  
			7 29  
			10 2  
			27 2
			39 5  
			52 2  
			64 2  
			65 1  
			66 1  
			67 1  
			68 2  
			71 1  
		}

		SampleName="Peul"
		SampleSize=47
		SampleData= {
			1 11
			2 19
			7 12  
			8 2   
			34 1  
			39 1  
			69 1  
		}
		SampleName="Pima"
		SampleSize=63
		SampleData= {
			1 59
			6  2  
			39 1  
			46 1  
		}
		SampleName="Maya"
		SampleSize=37
		SampleData= {
			1 30
			47 4  
			95 3  
		}
		SampleName="Finnish"
		SampleSize=110
		SampleData= {
			1 87
			6 2    
			11 4   
			18 3   
			21 8   
			38 2   
			47 2   
			82 1   
			83 1   
		}
		SampleName="Sicilian"
		SampleSize=90
		SampleData= {
			1   50
			2    3
			6    9
			18  11  
			21   1  
			23   1  
			34   1  
			42   1  
			47   5  
			56   1  
			57   2  
			72   1  
			73   1  
			75   1  
			76   1  
			77   1  
		}
		SampleName="Israeli Jew"
		SampleSize=39
		SampleData= {
			1 15
			6 14
			11 1 
			17 1 
			22 4 
			36 1 
			37 1 
			38 1 
			39 1
		}
		SampleName="Israeli Arab"
		SampleSize=39
		SampleData= {
			1 22   
			2 1    
			6 1    
			7 1    
			22 6   
			31 2   
			40 1   
			41 1   
			42 1
			43 1   
			44 1   
			45 1   
		}

	[[Structure]]

		StructureName="An example of structure with 5 geographic regions"
		NbGroups=5

		#Asia
		Group={
		"Oriental" 
		"Tharu"
		}

		#Africa
		Group={
			"Wolof"
			"Peul"
		}

		#America
		Group={
			"Pima"
			"Maya"
		}

		#Europe
		Group={
			"Finnish"
			"Sicilian"
		}

		#Middle East
		Group={
			"Israeli Jew"
			"Israeli Arab"
		}'	