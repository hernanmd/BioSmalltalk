"
Helper class to easy reading entrez search results

"
Class {
	#name : #BioEntrezSearchResultReader,
	#superclass : #BioEntrezXmlReader,
	#category : 'BioEntrez-Core'
}

{ #category : #private }
BioEntrezSearchResultReader class >> isPreferredFor: aString [
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString beginsWith: '<?xml version="1.0" ?>
<!DOCTYPE eSearchResult PUBLIC "-//NLM//DTD eSearchResult'
]

{ #category : #accessing }
BioEntrezSearchResultReader >> correctedQuery [
	" Answer a <String> with the corrected query spelling suggestion "
	
	^ [ self accessNode: 'CorrectedQuery' ]
	on: BioNotFoundObject
	do: [ : ex | String empty ]

]

{ #category : #accessing }
BioEntrezSearchResultReader >> count [
	" Answer a <String> with the number of search results "
	
	^ (self accessNode: 'Count') first
]

{ #category : #accessing }
BioEntrezSearchResultReader >> idList [
	" Answer a <Collection> with GenBank identifiers "
	
	^ (self accessNodes: 'Id') at: 'Id'
]

{ #category : #accessing }
BioEntrezSearchResultReader >> keys [
	" Answer a <Collection> with the search results keys (node names) "
	
	^ (self keysParserClass parse: self results) parseDocument

]

{ #category : #'accessing private' }
BioEntrezSearchResultReader >> keysParserClass [

	^ BioEResultKeysParser
]

{ #category : #'accessing private' }
BioEntrezSearchResultReader >> parserClass [
	" Private - See superimplementor's comment "
	
	^ BioParser
]

{ #category : #accessing }
BioEntrezSearchResultReader >> queryKey [
	" Answer a <String> with Entrez search result query key "
	
	^ self accessNode: 'QueryKey'
]

{ #category : #accessing }
BioEntrezSearchResultReader >> retMax [
	" Answer a String with number of record retrieved
	See http://www.ncbi.nlm.nih.gov/corehtml/query/static/esummary_help.html#DisplayNumbers for details "
	
	^ (self accessNode: 'RetMax') first
]

{ #category : #'accessing private' }
BioEntrezSearchResultReader >> selectNodes: nodesCollection in: anObject [

	^ self parserClass 
			tokenizeNcbiXmlEntrezSearchResult: anObject contents 
			nodes: nodesCollection
]

{ #category : #accessing }
BioEntrezSearchResultReader >> webEnv [
	" Answer a <String> with Entrez search result web environment "
	
	^ self accessNode: 'WebEnv'
]
