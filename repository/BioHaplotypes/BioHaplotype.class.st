"
A haplotype is a set of DNA variations, or polymorphisms, that tend to be inherited together. A haplotype can refer to a combination of alleles or to a set of single nucleotide polymorphisms (SNPs) found on the same chromosome. Information about haplotypes is being collected by the International HapMap Project and is used to investigate the influence of genes on disease.

Instance Variables
	popFreq:		<Object>
	sequence:		<Object>

popFreq
	- xxxxx


"
Class {
	#name : #BioHaplotype,
	#superclass : #BioSequence,
	#instVars : [
		'popFreq'
	],
	#category : 'BioHaplotypes-Core'
}

{ #category : #'instance creation' }
BioHaplotype class >> readFrom: collection [
	" collection contains subcollections, each one an haplotype block "
	
	^ collection collect: [ : htCol | 
		htCol pairsCollect: [ : hSeq : hFreq | 
			self new 
				sequence: hSeq; 
				popFreq: hFreq; 
				yourself ] ].
]

{ #category : #accessing }
BioHaplotype >> haplotypeIdentifier [

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self sequence asString;
			space;
			nextPutAll: (self popFreq printShowingDecimalPlaces: 3) ]
]

{ #category : #accessing }
BioHaplotype >> popFreq [
	^ popFreq
]

{ #category : #accessing }
BioHaplotype >> popFreq: anObject [
	popFreq := anObject
]
