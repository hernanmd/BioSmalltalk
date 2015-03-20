testing
testIncludesBeginWith

	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWith: 'the').
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWith: 'money').
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWith: String empty ).

	self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWith: Array empty ] raise: MessageNotUnderstood.
	self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWith: nil ] raise: MessageNotUnderstood.
