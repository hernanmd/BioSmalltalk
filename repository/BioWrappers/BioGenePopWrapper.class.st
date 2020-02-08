"
Computes exact tests or their unbiased estimation for Hardy-Weinberg equilibrium, population differentiation, and two-locus genotypic disequilibrium. Genepop performs analyses of isolation by distance from pairwise comparisons of individuals or population samples, including confidence intervals for neighbourhood size. It allows comparison of differentiation over a given range of geographical distances, in intra vs. inter-ecotypic analyses thank to the implementation of a bootstrap analysis of mean differentiation. 
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
