"
A haplotype block is a set of closely linked alleles/markers on a chromosome that, over evolutionary time, tend to be inherited together

Instance Variables
	correlation:		<Object>
	crossingLines:		<Object>
	haplotypes:		<Object>
	markerNumbers:		<Object>
	tagSnps:		<Object>

correlation
	- xxxxx

crossingLines
	- xxxxx

haplotypes
	- xxxxx

markerNumbers
	- xxxxx

tagSnps
	- xxxxx

"
Class {
	#name : #BioHaplotypeBlock,
	#superclass : #BioObject,
	#instVars : [
		'markerNumbers',
		'tagSnps',
		'haplotypes',
		'crossingLines',
		'correlation'
	],
	#category : 'BioHaplotypes-Core'
}

{ #category : #accessing }
BioHaplotypeBlock >> correlation [
	" Answer the multi-locus D prime "

	^ correlation
]

{ #category : #accessing }
BioHaplotypeBlock >> correlation: anObject [
	correlation := anObject
]

{ #category : #accessing }
BioHaplotypeBlock >> haplotypes [
	^ haplotypes
]

{ #category : #accessing }
BioHaplotypeBlock >> haplotypes: anObject [
	haplotypes := anObject
]

{ #category : #accessing }
BioHaplotypeBlock >> markerNumbers [
	^ markerNumbers
]

{ #category : #accessing }
BioHaplotypeBlock >> markerNumbers: anObject [
	markerNumbers := anObject
]

{ #category : #accessing }
BioHaplotypeBlock >> tagSnps [
	^ tagSnps
]

{ #category : #accessing }
BioHaplotypeBlock >> tagSnps: anObject [
	tagSnps := anObject
]
