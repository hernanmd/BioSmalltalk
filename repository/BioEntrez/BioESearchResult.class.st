"
BioESearchResult represents a result set from an Entrez database.



"
Class {
	#name : #BioESearchResult,
	#superclass : #BioWebResult,
	#category : 'BioEntrez-Core'
}

{ #category : #accessing }
BioESearchResult >> correctedQuery [
	" Answer a String with the corrected query spelling suggestion "
	
	^ self reader correctedQuery
]

{ #category : #accessing }
BioESearchResult >> count [
	" Answer a Number representing how many records there are for the
	receiver's results "

	^ self result
]

{ #category : #accessing }
BioESearchResult >> idList [
	" Answer a Collection with the receiver's GenBank identifiers "
	
	^ self reader idList
]

{ #category : #testing }
BioESearchResult >> isEntrezSearchResult [
	" Answer <true> if receiver represents a result obtained through Entrez system "

	^ true
]

{ #category : #accessing }
BioESearchResult >> keys [
	" Answer a Collection with the search results keys (node names) "
	
	^ self reader keys
]

{ #category : #accessing }
BioESearchResult >> queryKey [
	" Answer a String with the receiver's query key "
	
	^ self reader queryKey
]

{ #category : #private }
BioESearchResult >> readerClass [

	^ BioEntrezSearchResultReader
]

{ #category : #accessing }
BioESearchResult >> webEnv [
	" Answer a String with the receiver's web environment "
	
	^ self reader webEnv
]
