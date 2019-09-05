Extension { #name : #Collection }

{ #category : #'*BioSupport' }
Collection >> fillMatrix: aMatrix atColumn: aColumnNumber [
	" Fill aMatrix with the receiver at aColumnNumber "
	
	aMatrix atColumn: aColumnNumber put: self
]

{ #category : #'*BioSupport' }
Collection >> fillMatrix: aMatrix atColumn: colNumber repeat: repNumber [
	" Repeat repNumber times, aValue in column colNumber 
	Example: self atColumn: 1 fillWith: 'BM1818' repeat: 3
	produces
	[ 'BM1818' nil nil nil 
	'BM1818' nil nil nil 	
	'BM1818' nil nil nil 	
	nil nil nil nil 			
	nil nil nil nil ]
	"
	aMatrix atColumn: colNumber put: self repeat: repNumber
]

{ #category : #'*BioSupport' }
Collection >> fillMatrix: aMatrix atColumn: aColumnNumber startingAt: rowNumber [
	" Fill aMatrix with the receiver at aColumnNumber beggining at rowNumber. "
	
	aMatrix atColumn: aColumnNumber put: self startingAt: rowNumber
]

{ #category : #'*BioSupport' }
Collection >> fillMatrix: aMatrix atRow: aColumnNumber [
	" Fill aMatrix with the receiver at aColumnNumber "
	
	aMatrix atRow: aColumnNumber put: self
]

{ #category : #'*BioSupport' }
Collection >> fillMatrix: aMatrix atRow: rowNumber startingAt: startColumnNumber [
	" Fill aMatrix with the receiver at aColumnNumber beggining at rowNumber. "
	
	aMatrix 
		atRow: rowNumber 
		put: self 
		startingAt: startColumnNumber
]
