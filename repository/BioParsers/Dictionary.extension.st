Extension { #name : #Dictionary }

{ #category : #'*BioParsers' }
Dictionary >> blastNodeNames [

	^ ( self collect: [: each | each value ] ) keys
]
