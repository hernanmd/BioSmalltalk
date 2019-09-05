"
Several considerations for calculation of consensus sequence are:

- Set of characters (""letters"") to consider, example: ""ACGTU-"" or ""ACGTUX-""

- A percentage presence which must be met by any character if it is to be considered in computing the consensus for a column

- Consider any character when making consensus
"
Class {
	#name : #BioConsensusStrategy,
	#superclass : #BioObject,
	#category : #'BioTools-Helpers'
}
