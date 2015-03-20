testing
testTriplesDo

	| testCol resultCol |
	
	testCol := #('a' 'b' 'c' 1 2 3 'd' 'e' 'f').
	resultCol := OrderedCollection new.
	testCol triplesDo: [ : a : b : c | resultCol add: a; add: b; add: c ].
	self assert: (resultCol hasEqualElements: testCol).
	
	testCol := #('a' 'b' 'c' 1 2).
	resultCol := OrderedCollection new.	
	testCol triplesDo: [ : a : b : c | resultCol add: a; add: b; add: c ].
	self assert: (resultCol hasEqualElements: #('a' 'b' 'c')).

	testCol := #('a' 'b' 'c' 1).
	resultCol := OrderedCollection new.	
	testCol triplesDo: [ : a : b : c | resultCol add: a; add: b; add: c ].
	self assert: (resultCol hasEqualElements: #('a' 'b' 'c')).