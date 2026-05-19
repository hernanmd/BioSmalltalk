Class {
	#name : 'BioMAFRowNode',
	#superclass : 'Object',
	#instVars : [
		'fields'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'as yet unclassified' }
BioMAFRowNode >> fields [ ^ fields
]

{ #category : 'as yet unclassified' }
BioMAFRowNode >> fields: anArray [ fields := anArray
]

{ #category : 'as yet unclassified' }
BioMAFRowNode >> initialize [ super initialize. fields := OrderedCollection new
]
