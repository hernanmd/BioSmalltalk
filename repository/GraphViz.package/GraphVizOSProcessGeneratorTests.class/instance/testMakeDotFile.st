testing
testMakeDotFile

	| gv fileName fs |
	gv := self historyOfSmalltalk.
	fileName := gv generator outputFileNameFor: #plain.
	FileDirectory default deleteFileNamed: fileName ifAbsent: [].
	gv make: #plain.
	fs := FileStream fileNamed: fileName.
	[self assert: ((fs contents last: 20) copyWithoutAll: (String cr, String lf)) = '58 solid blackstop']
		ensure:
			[fs close.
			FileDirectory default deleteFileNamed: fileName ifAbsent: []]
