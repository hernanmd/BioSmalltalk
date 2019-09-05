"
Parser for extracting XML nodes returned by a Entrez Search result.
See http://www.ncbi.nlm.nih.gov/books/NBK25500/ for details (15/11/2011)
"
Class {
	#name : #BioEResultKeysParser,
	#superclass : #BioEntrezResultParser,
	#category : 'BioParsers-Core'
}

{ #category : #content }
BioEResultKeysParser >> defaultNodes [

	^ #( 'eSearchResult' 'Count' 'RetMax' 'RetStart' 'QueryKey' 'WebEnv' 'IdList' 'TranslationSet' 'QueryTranslation')
]

{ #category : #private }
BioEResultKeysParser >> resultClass [
	" Private - See superimplementor's comment "
	
	^ Set
]

{ #category : #content }
BioEResultKeysParser >> startElement: elementName attributeList: attributeList [
	" Private - See superimplementor's comment "
	
	results add: elementName

]

{ #category : #content }
BioEResultKeysParser >> startElement: elementName attributes: attributeList [
	" Private - See superimplementor's comment "

	results add: elementName

]
