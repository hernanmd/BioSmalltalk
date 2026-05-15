"
Represents a biological material sample with a named location. Extends BioNamedObject. Instance Variables: location <String> Storage or origin location.
"
Class {
	#name : 'BioMaterial',
	#superclass : 'BioNamedObject',
	#instVars : [
		'location'
	],
	#category : 'BioSupport-Core',
	#package : 'BioSupport',
	#tag : 'Core'
}

{ #category : 'accessing' }
BioMaterial >> location [
	^ location
]

{ #category : 'accessing' }
BioMaterial >> location: anObject [
	location := anObject
]
