Class {
	#name : #BioMatrixFormatterTest,
	#superclass : #BioFormatterTest,
	#category : 'BioFormatterTests-Core'
}

{ #category : #accessing }
BioMatrixFormatterTest >> formatterClass [
	" Answer the concrete BioFormatter class being tested "
	
	^ BioMatrixFormatter 
]

{ #category : #accessing }
BioMatrixFormatterTest >> setUp [

	formatter := self formatterClass new.
]

{ #category : #'tests-populating' }
BioMatrixFormatterTest >> testAtColumnFillWith [

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
]

{ #category : #'tests-populating' }
BioMatrixFormatterTest >> testAtColumnFillWithRepeat [

	(self formatter initMatrixRows: 1 columns: 1)
		atColumn: 1 fillWith: 0 repeat: 1.
	self assert: ((self formatter atColumn: 1) asArray hasEqualElements: #(0)).
	(self formatter initMatrixRows: 2 columns: 1)
		atColumn: 1 fillWith: 2 repeat: 1.
	self assert: ((self formatter atColumn: 1) asArray hasEqualElements: #(2 nil)).
	(self formatter initMatrixRows: 2 columns: 2)
		atColumn: 1 fillWith: 2 repeat: 2;
		atColumn: 2 fillWith: 4 repeat: 1. 
	self assert: ((self formatter atColumn: 1) asArray hasEqualElements: #(2 2)).
	self assert: ((self formatter atColumn: 2) asArray hasEqualElements: #(4 nil)).
]

{ #category : #'tests-populating' }
BioMatrixFormatterTest >> testAtColumnFillWithStartingAt [
]

{ #category : #'tests-populating' }
BioMatrixFormatterTest >> testAtRowFillWith [
]

{ #category : #'tests-populating' }
BioMatrixFormatterTest >> testAtRowFillWithStartingAt [
]
