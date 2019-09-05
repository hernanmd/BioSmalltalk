Extension { #name : #SequenceableCollection }

{ #category : #'*BioParsers' }
SequenceableCollection >> matches: cmpSymbol receiver: recv [

	^ recv
		perform: cmpSymbol 
		withArguments: self asArray
]
