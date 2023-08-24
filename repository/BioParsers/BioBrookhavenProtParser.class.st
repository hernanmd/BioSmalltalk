"
pdb|entry|chain

"
Class {
	#name : #BioBrookhavenProtParser,
	#superclass : #BioNCBIIdParser,
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioBrookhavenProtParser class >> identifier [
	" See superimplementor's comment "

	^ 'pdb'
]

{ #category : #'initialize-release' }
BioBrookhavenProtParser >> chain [

	^ self parserForNonFastaString
]

{ #category : #'initialize-release' }
BioBrookhavenProtParser >> entry [

	^ self parserForNonFastaString
]

{ #category : #initialization }
BioBrookhavenProtParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asPParser , 
			self entry , 
			$| asPParser ,
			self chain
]
