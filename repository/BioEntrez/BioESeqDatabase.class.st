Class {
	#name : #BioESeqDatabase,
	#superclass : #BioERetDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioESeqDatabase >> displayDefault [
	" Show the bioseq for gi of interest (default in Entrez) "
	
	self client queryAt: 'complexity' put: '0'
]

{ #category : #accessing }
BioESeqDatabase >> displayMinimalBioseq [
	" get the minimal bioseq-set containing the gi of interest "
	
	self client queryAt: 'complexity' put: '2'
]

{ #category : #accessing }
BioESeqDatabase >> displayMinimalNucProt [
	" get the minimal nuc-prot containing the gi of interest "
	
	self client queryAt: 'complexity' put: '3'
]

{ #category : #accessing }
BioESeqDatabase >> displayMinimalPubSet [
	" get the minimal pub-set containing the gi of interest "
	
	self client queryAt: 'complexity' put: '4'
]

{ #category : #accessing }
BioESeqDatabase >> displayWholeBlob [
	" gi is often a part of a biological blob, containing other gis  "
	
	self client queryAt: 'complexity' put: '0'
]

{ #category : #actions }
BioESeqDatabase >> fetch [
	" Answer the result of the command applied on the receiver "

	^ self client fetchSequence
]

{ #category : #accessing }
BioESeqDatabase >> seqStart: aBaseNumber [
	" Show sequence starting from this base number "
	
	self client queryAt: 'seq_start' put: aBaseNumber asString
]

{ #category : #accessing }
BioESeqDatabase >> seqStop: aBaseNumber [
	" Show sequence ending on this base number "
	
	self client queryAt: 'seq_stop'  put: aBaseNumber asString
]

{ #category : #accessing }
BioESeqDatabase >> strandMinus [
	" What strand of DNA to show (2 = minus) "
	
	self client queryAt: 'strand' put: '2'
]

{ #category : #accessing }
BioESeqDatabase >> strandPlus [
	" What strand of DNA to show (1 = plus) "
	
	self client queryAt: 'strand' put: '1'
]
