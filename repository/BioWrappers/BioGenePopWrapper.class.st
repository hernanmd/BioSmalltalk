"
Computes exact tests or their unbiased estimation for Hardy-Weinberg equilibrium, population differentiation, and two-locus genotypic disequilibrium. Genepop performs analyses of isolation by distance from pairwise comparisons of individuals or population samples, including confidence intervals for neighbourhood size. It allows comparison of differentiation over a given range of geographical distances, in intra vs. inter-ecotypic analyses thank to the implementation of a bootstrap analysis of mean differentiation. 

Implementation currently inspired on the Biopython version: https://github.com/lu78/biopython---popgen/blob/df66627b9e4ea8962aada4336752069e2bf285d8/src/PopGen/GenePop/Controller.py

"
Class {
	#name : #BioGenePopWrapper,
	#superclass : #BioWrapperObject,
	#category : #'BioWrappers-Popgen'
}

{ #category : #accessing }
BioGenePopWrapper class >> url [
	" Answer a <String> representing receiver's URL "

	^ 'https://kimura.univ-montp2.fr/%7Erousset/Genepop.htm'
]

{ #category : #'as yet unclassified' }
BioGenePopWrapper >> buildCmdLineForAllFst: fileName [
	" Answer a <String> for executing FST analysis given fileName "
	
	^ String streamContents: [ : stream |
		stream 
			nextPutAll: ' Mode=Batch MenuOptions=6.1 InputFile=';
			nextPutAll: fileName;
			nextPutAll: '> /dev/null 2> /dev/null' ]
]

{ #category : #'as yet unclassified' }
BioGenePopWrapper >> calcFstAll: fileName [
	" Calculates the Fst/Fis/Fit for all populations in fileName.
	Answer a <Collection> of (Locus name, Fis, Fst, Fit). Creates a file named fname.FST "
	

]

{ #category : #'as yet unclassified' }
BioGenePopWrapper >> getLociGenotypeCounts: fileName [
	" Answer the genotype count for all populations) in fileName "
	

]
