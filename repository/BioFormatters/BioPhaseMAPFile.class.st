"
This is the INP file format as described by PHASE software : 

"
Class {
	#name : #BioPhaseMAPFile,
	#superclass : #BioFile,
	#category : #'BioFormatters-Formatters-PHASE'
}

{ #category : #accessing }
BioPhaseMAPFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'MAP'
]
