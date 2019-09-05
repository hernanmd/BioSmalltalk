Class {
	#name : #BioMAFParserTest,
	#superclass : #BioAbstractFASTAParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #'sample-data' }
BioMAFParserTest >> mafSample01 [
	" From http://genome.ucsc.edu/FAQ/FAQformat.html "
	
	^ '##maf version=1 scoring=tba.v8 
# tba.v8 (((human chimp) baboon) (mouse rat)) 
                   
a score=23262.0     
s hg18.chr7    27578828 38 + 158545518 AAA-GGGAATGTTAACCAAATGA---ATTGTCTCTTACGGTG
s panTro1.chr6 28741140 38 + 161576975 AAA-GGGAATGTTAACCAAATGA---ATTGTCTCTTACGGTG
s baboon         116834 38 +   4622798 AAA-GGGAATGTTAACCAAATGA---GTTGTCTCTTATGGTG
s mm4.chr6     53215344 38 + 151104725 -AATGGGAATGTTAAGCAAACGA---ATTGTCTCTCAGTGTG
s rn3.chr4     81344243 40 + 187371129 -AA-GGGGATGCTAAGCCAATGAGTTGTTGTCTCTCAATGTG
                   
a score=5062.0                    
s hg18.chr7    27699739 6 + 158545518 TAAAGA
s panTro1.chr6 28862317 6 + 161576975 TAAAGA
s baboon         241163 6 +   4622798 TAAAGA 
s mm4.chr6     53303881 6 + 151104725 TAAAGA
s rn3.chr4     81444246 6 + 187371129 taagga

a score=6636.0
s hg18.chr7    27707221 13 + 158545518 gcagctgaaaaca
s panTro1.chr6 28869787 13 + 161576975 gcagctgaaaaca
s baboon         249182 13 +   4622798 gcagctgaaaaca
s mm4.chr6     53310102 13 + 151104725 ACAGCTGAAAATA'
]

{ #category : #'sample-data' }
BioMAFParserTest >> mafSample02 [
	" From https://cgwb.nci.nih.gov/goldenPath/help/maf.html "
	
	^ '##maf version=1 scoring=probability
#mblastz 8.91 02-Jan-2005

a score=0.128
s human_hoxa 100  9 + 100257 ACA-TTACT
s horse_hoxa 120 10 -  98892 ACAATTGCT
s fugu_hoxa   88  8  + 90788 ACA--TGCT

a score=0.071
s human_unc 9077 8 + 10998 ACAGTATT
s horse_unc 4555 6 -  5099 ACA--ATT
s fugu_unc  4000 4 +  4038 AC----TT'
]

{ #category : #accessing }
BioMAFParserTest >> parserClass [

	^ BioMAFParser
]

{ #category : #accessing }
BioMAFParserTest >> setUp [

	super setUp.
	parser := self parserClass new
]

{ #category : #testing }
BioMAFParserTest >> testMultiSeqAlignment01 [

	parseResult := self parser parse: self mafSample01.
	self assert: true

]

{ #category : #testing }
BioMAFParserTest >> testMultiSeqAlignment02 [

	parseResult := self parser parse: self mafSample02.
	self assert: true

]
