Class {
	#name : #BioHaplotypesTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'haploBlock2',
		'haplotypes',
		'haploBlock1'
	],
	#category : 'BioHaplotypesTest-Core'
}

{ #category : #accessing }
BioHaplotypesTest >> haploBlock1 [
	^ haploBlock1
]

{ #category : #accessing }
BioHaplotypesTest >> haploBlock1: anObject [
	haploBlock1 := anObject
]

{ #category : #accessing }
BioHaplotypesTest >> haploBlock2 [
	^ haploBlock2
]

{ #category : #accessing }
BioHaplotypesTest >> haploBlock2: anObject [
	haploBlock2 := anObject
]

{ #category : #accessing }
BioHaplotypesTest >> haplotypes [
	^ haplotypes
]

{ #category : #accessing }
BioHaplotypesTest >> haplotypes: anObject [
	haplotypes := anObject
]

{ #category : #accessing }
BioHaplotypesTest >> setUp [ 

	self haplotypes: (BioHaplotype readFrom: #( 
	#('CTACTGG' 0.475 'TCCATTA' 0.308 'TCCAATA' 0.200 'TTCATGG' 0.017) 
	#('GATGCAACGATGCGGGT' 0.333 'ACCATGCTAGCTGAAAC' 0.438 'ACCGTGCTAGCTGAAAC' 0.035 'AATGCAACGATGCGGGY' 0.142 'ACCATGCTAGCTGAAAC' 0.027 'AACGGCCTAGCTCAAGT' 0.017) )).

	self haploBlock1: (BioHaplotypeBlock new
		markerNumbers: #(3 7 9 15 23 25 34);
		correlation: 0.95;
		haplotypes: self haplotypes first).
		
	self haploBlock2: (BioHaplotypeBlock new
		markerNumbers: #(43 47 52 60 65 66 67 69 70 71 72 74 78 80 84 86 92);
		haplotypes: self haplotypes second).	
]

{ #category : #testing }
BioHaplotypesTest >> testCorrelation [

	self assert: (self haploBlock1 correlation isKindOf: Float).
	self assert: self haploBlock1 correlation = 0.95.	

	self haploBlock1 correlation: 0.97.
	self assert: self haploBlock1 correlation = 0.97.
	

]

{ #category : #testing }
BioHaplotypesTest >> testHaplotypeIdentifier [

	| haplotypeCollection |
	
	haplotypeCollection := self haplotypes anyOne.
	self assert: (haplotypeCollection anyOne haplotypeIdentifier isKindOf: String).

]

{ #category : #testing }
BioHaplotypesTest >> testHaplotypes [

	self assert: (self haploBlock1 haplotypes isKindOf: Collection).
	self assert: (self haploBlock1 haplotypes allSatisfy: [ : h | h isKindOf: BioHaplotype ]).

]

{ #category : #testing }
BioHaplotypesTest >> testMarkerNumbers [

	| newMarkers |
	
	self assert: (self haploBlock1 markerNumbers isKindOf: Collection).
	self assert: (self haploBlock1 markerNumbers allSatisfy: #isNumber).
	
	newMarkers := #(1 2 3 4).
	self haploBlock1 markerNumbers: newMarkers.
	self assert: (self haploBlock1 markerNumbers hasEqualElements: newMarkers).
	
]
