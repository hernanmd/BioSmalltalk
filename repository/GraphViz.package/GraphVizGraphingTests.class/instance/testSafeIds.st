as yet unclassified
testSafeIds

	self should: [(graph safeIdFor: #A) = #A].
	self should: [(graph safeIdFor: 10) = '10'].
	self should: [(graph safeIdFor: '"10"') = '"10"'].
	self should: [(graph safeIdFor: '<TABLE> </TABLE>') = '<TABLE> </TABLE>'].
	
	self should: [(graph safeIdFor: '10ABC') = '"10ABC"'].
	self should: [(graph safeIdFor: 'ABC DEF') = '"ABC DEF"'].
	self should: [(graph safeIdFor: 'ABC-DEF') = '"ABC-DEF"'].