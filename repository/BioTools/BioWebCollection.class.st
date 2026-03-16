Class {
	#name : 'BioWebCollection',
	#superclass : 'BioOrderedCollection',
	#category : 'BioTools-Collections',
	#package : 'BioTools',
	#tag : 'Collections'
}

{ #category : 'accessing' }
BioWebCollection >> addParametersTo: aBioClient [
	" Format and add the receiver's elements to aBioClient "

	aBioClient addParameters: self baseUrl.

]
