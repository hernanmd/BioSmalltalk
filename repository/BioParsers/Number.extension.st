Extension { #name : #Number }

{ #category : #'*bioparsers' }
Number >> asBlastParameter [

	^ self asNumber
]

{ #category : #'*bioparsers' }
Number >> blastValue [
	" Answer the receiver's value "

	^ self
]

{ #category : #'*bioparsers' }
Number >> matches: cmpSymbol receiver: recv [

	^ recv
		perform: cmpSymbol 
		with: self
]
