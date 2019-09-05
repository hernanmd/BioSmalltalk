Extension { #name : #String }

{ #category : #'*BioPopulation' }
String >> bioLocationPrefixes [
	" Answer a <Collection> of english common territorial prefixes "

	^ { 'S' . 'N' . 'C' . 'W' . 'E' .
	'SW' . 'SE' . 'NW' . 'NE' . 'WN' . 'WS' . 'EN' . 'ES' .
	'NSW' .
	'to' . 'and' . 'of' . 'region' . 'area' . 'i.e.' }
]

{ #category : #'*BioPopulation' }
String >> bioRemovePrefixes [

	| tokenizedLocation |

	tokenizedLocation := self findTokens: String space.
	tokenizedLocation removeAllSuchThat: [: tokString |
		self bioLocationPrefixes includes: tokString ].
	^ tokenizedLocation joinUsing: self class space.

]

{ #category : #'*BioPopulation' }
String >> locationsWithoutPrefixes [
	" Answer a <Collection> of Strings with receiver's locations without common prefixes "

	^ OrderedCollection with: self bioRemovePrefixes 
]
