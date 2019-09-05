"
A standard naming is a null namer, only trims a name.

"
Class {
	#name : #BioStandardNaming,
	#superclass : #BioNaming,
	#category : #'BioFormatters-Naming'
}

{ #category : #accessing }
BioStandardNaming >> format: aString [
	" See superimplementor's comment "

	^ aString asString trimBoth copyReplaceAll: ' ' with: '_'

]
