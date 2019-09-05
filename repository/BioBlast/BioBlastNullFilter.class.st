"
Used for cancelled queries

"
Class {
	#name : #BioBlastNullFilter,
	#superclass : #BioFilter,
	#category : 'BioBlast-Local'
}

{ #category : #testing }
BioBlastNullFilter >> hasNewResults [
	" Answer <false> since receiver is a null filter "

	^ false
]
