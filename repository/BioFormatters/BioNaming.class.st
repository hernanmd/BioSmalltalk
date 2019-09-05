"
Strategy to format names accordingly to specific conditions. The #format: method must be implemented in subclasses
"
Class {
	#name : #BioNaming,
	#superclass : #BioObject,
	#category : 'BioFormatters-Naming'
}

{ #category : #accessing }
BioNaming >> format: aString [
	" Answer a String from contracting first letters from aString "

	self subclassResponsibility
]

{ #category : #testing }
BioNaming >> isNamingFormat [

	^ true
]
