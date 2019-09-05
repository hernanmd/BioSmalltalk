Extension { #name : #String }

{ #category : #'*BioParsers' }
String >> asAccession [
	" Answer a new <BioAccession> object for the receiver "

	^ BioParser parseAccession: self
]

{ #category : #'*BioParsers' }
String >> asBlastParameter [

	^ self isNumeric
		ifTrue: [ self asNumber ]
		ifFalse: [ | tokens |
			(tokens := self trimBoth findTokens: ',') size = 2
				ifTrue: [ 
					tokens := tokens collect: #trimBoth.
					(tokens allSatisfy: [ : queryParam | queryParam isNumeric ]) "100,200"
						ifFalse: [ self asLowercase ] "  'Bos taurus isolate ARG19 D-loop' 'partial sequence; mitochondrial'  "
						ifTrue: [ (tokens collect: #asNumber) asArray ] ]
				ifFalse: [ 
					(tokens := self trimBoth findTokens: '|') size = 2
						ifTrue: [ tokens := (tokens collect: #trimBoth) asLowercase ]
						ifFalse: [ self asLowercase ] ] ]
]

{ #category : #'*BioParsers' }
String >> asBlastValue [

	^ self asLowercase
]

{ #category : #'*BioParsers' }
String >> asGeneId [

	^ BioParser tokenizeGi: self
]

{ #category : #'*BioParsers' }
String >> matches: cmpSymbol receiver: recv [

	^ recv asLowercase
		perform: cmpSymbol
		with: self asBlastParameter

]
