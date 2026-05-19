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

{ #category : 'accessing' }
BioMAFRowNode >> fields [ ^ fields
]

{ #category : 'accessing' }
BioMAFRowNode >> fields: anArray [ fields := anArray
]

{ #category : 'initialization' }
BioMAFRowNode >> initialize [ super initialize. fields := OrderedCollection new
]
