Class {
	#name : 'BioMAFScanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'as yet unclassified' }
BioMAFScanner >> emptySymbol [ ^ #empty
]

{ #category : 'as yet unclassified' }
BioMAFScanner >> errorSymbol [ ^ #error
]

{ #category : 'as yet unclassified' }
BioMAFScanner >> scanForToken [ ^ SmaCCToken value: (String new) start: stream position stop: stream position
]
