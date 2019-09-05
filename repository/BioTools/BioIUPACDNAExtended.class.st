"
BioIUPACDNAExtended

From IUPACData.py

#   B == 5-bromouridine
#   D == 5,6-dihydrouridine
#   S == thiouridine
#   W == wyosine
 
"
Class {
	#name : #BioIUPACDNAExtended,
	#superclass : #BioIUPACDNA,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACDNAExtended class >> codes [
	" See superimplementor's comment "
	
	^ 'GATCBDSW'
]

{ #category : #printing }
BioIUPACDNAExtended >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: ' -> Extended'
]
