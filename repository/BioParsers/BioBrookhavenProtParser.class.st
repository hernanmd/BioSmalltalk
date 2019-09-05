"
pdb|entry|chain

"
Class {
	#name : #BioBrookhavenProtParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
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

{ #category : #'initialize-release' }
BioBrookhavenProtParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asParser , 
			self entry , 
			$| asParser ,
			self chain
]
