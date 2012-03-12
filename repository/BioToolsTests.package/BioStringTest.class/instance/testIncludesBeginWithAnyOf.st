testing
testIncludesBeginWithAnyOf

	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('the') ).
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('money') ).
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('money' 'casino') ).	
	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('ove' 'money') ).
	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('money' 'lazy') ).
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #() ).
	
	self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: 'money' ] raise: MessageNotUnderstood.
	"self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: String empty ] raise: MessageNotUnderstood."
	self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: nil ] raise: MessageNotUnderstood.
