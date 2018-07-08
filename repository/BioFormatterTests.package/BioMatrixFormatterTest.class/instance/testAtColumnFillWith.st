tests-populating
testAtColumnFillWith

	(self formatter initMatrixRows: 1 columns: 1)
		atColumn: 1 fillWith: 0.
	self assert: ((self formatter atColumn: 1) asArray hasEqualElements: #(0)).
	(self formatter initMatrixRows: 2 columns: 1)
		atColumn: 1 fillWith: 2.
	self assert: ((self formatter atColumn: 1) asArray hasEqualElements: #(2 2)).
	(self formatter initMatrixRows: 2 columns: 2)
		atColumn: 1 fillWith: 2;
		atColumn: 2 fillWith: 4. 
	self assert: ((self formatter atColumn: 1) asArray hasEqualElements: #(2 2)).
	self assert: ((self formatter atColumn: 2) asArray hasEqualElements: #(4 4)).