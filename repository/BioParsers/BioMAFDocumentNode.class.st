Class {
	#name : 'BioMAFDocumentNode',
	#superclass : 'Object',
	#instVars : [
		'headerFields',
		'rows'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'as yet unclassified' }
BioMAFDocumentNode >> asMutationSet [
	| mutationSet |
	mutationSet := BioMutationSet new.
	mutationSet customColumns: headerFields asArray.
	rows do: [ :row | | mut fields |
		mut := BioMutation new.
		fields := row fields.
		1 to: (headerFields size min: fields size) do: [ :i |
			BioMAFSmaCCParser new setField: (headerFields at: i) value: (fields at: i) in: mut ].
		mutationSet addMutation: mut ].
	^ mutationSet
]

{ #category : 'as yet unclassified' }
BioMAFDocumentNode >> headerFields [ ^ headerFields
]

{ #category : 'as yet unclassified' }
BioMAFDocumentNode >> headerFields: anArray [ headerFields := anArray
]

{ #category : 'as yet unclassified' }
BioMAFDocumentNode >> initialize [ super initialize. headerFields := OrderedCollection new. rows := OrderedCollection new
]

{ #category : 'as yet unclassified' }
BioMAFDocumentNode >> rows [ ^ rows
]

{ #category : 'as yet unclassified' }
BioMAFDocumentNode >> rows: anArray [ rows := anArray
]
