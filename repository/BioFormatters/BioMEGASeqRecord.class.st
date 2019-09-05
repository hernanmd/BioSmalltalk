"
A BioMEGASeqRecord is a helper class for a MEGA file formatter.

Instance Variables
	alignment:		<BioAlignment> 
"
Class {
	#name : #BioMEGASeqRecord,
	#superclass : #BioSeqRecord,
	#instVars : [
		'alignment'
	],
	#category : #'BioFormatters-Formatters-MEGA'
}

{ #category : #accessing }
BioMEGASeqRecord >> alignment [
	^ alignment
]

{ #category : #accessing }
BioMEGASeqRecord >> alignment: anObject [
	alignment := anObject
]

{ #category : #accessing }
BioMEGASeqRecord >> exportTo: aWriteStream nameSpacing: anInteger  alignmentNumber: alnNumber [
	" Private - Write the receiver's name and first alignment line then pop it from the alignment "
	
	aWriteStream	
		cr;
		nextPut: $#;
		nextPutAll: self name;
		nextPut: $_;
		nextPutAll: alnNumber asString.
	anInteger - self name size + 3 timesRepeat: [ aWriteStream space ].
	aWriteStream nextPutAll: self popAlignment. 
]

{ #category : #testing }
BioMEGASeqRecord >> hasEmptyAlignment [

	^ self alignment isEmpty
]

{ #category : #accessing }
BioMEGASeqRecord >> popAlignment [

	^ self alignment removeFirst.
]

{ #category : #printing }
BioMEGASeqRecord >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		space;
		nextPutAll: self name between: $( and: $)
]
