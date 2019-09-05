Class {
	#name : #BioGenBankParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #testing }
BioGenBankParserTest >> gbSeq01 [
	" From http://www.genomatix.de/online_help/help/sequence_formats.html "

	^ 'LOCUS       AB000263                 368 bp    mRNA    linear   PRI 05-FEB-1999
DEFINITION  Homo sapiens mRNA for prepro cortistatin like peptide, complete
            cds.
ACCESSION   AB000263
ORIGIN      
        1 acaagatgcc attgtccccc ggcctcctgc tgctgctgct ctccggggcc acggccaccg
       61 ctgccctgcc cctggagggt ggccccaccg gccgagacag cgagcatatg caggaagcgg
      121 caggaataag gaaaagcagc ctcctgactt tcctcgcttg gtggtttgag tggacctccc
      181 aggccagtgc cgggcccctc ataggagagg aagctcggga ggtggccagg cggcaggaag
      241 gcgcaccccc ccagcaatcc gcgcgccggg acagaatgcc ctgcaggaac ttcttctgga
      301 agaccttctc ctcctgcaaa taaaacctca cccatgaatg ctcacgcaag tttaattaca
      361 gacctgaa
//
'
]

{ #category : #accessing }
BioGenBankParserTest >> setUp [ 

	super setUp.
	parser := BioGBParser new
]

{ #category : #testing }
BioGenBankParserTest >> testGenBank01 [

	self assert: ( BioParser tokenizeAccession:  'gb|AAM45611.1|AF384285_1' ) = #('AAM45611' '1').	
	self assert: ( BioParser tokenizeLocus: 'gb|AAM45611.1|AF384285_1' ) = 'AF384285_1'.

]
