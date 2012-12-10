running
testCollect

	| collection |
	terms := Terms sample.

	collection := terms collect: [ :each | each first ].

	self assert: (collection equalsTo: 'aaaaaaaabbbbbcccceefffffgiiiiiiiilllllmmmmmmnppppprrrssssssstttttttttttttttw' asBag).

	^collection