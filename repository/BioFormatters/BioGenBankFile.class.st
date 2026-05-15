"
Represents a GenBank format file. Extends BioFile with GenBank-specific file handling.
"
Class {
	#name : 'BioGenBankFile',
	#superclass : 'BioFile',
	#category : 'BioFormatters-Files',
	#package : 'BioFormatters',
	#tag : 'Files'
}

{ #category : 'accessing' }
BioGenBankFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'GenBank'
]
