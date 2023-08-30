Class {
	#name : #BioAbstractTest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Core'
}

{ #category : #accessing }
BioAbstractTest >> classFor: aLiteralOrClass [
	" Refer to BioObject class comment "
	
	^ BioObject classFor: aLiteralOrClass
]

{ #category : #accessing }
BioAbstractTest >> decode: aString [
	" Answer a String. Decodes the fields embedded in aString url ?var1=val1&var2=val2 "
	
	^ BioWebClientEngine decode: aString
]

{ #category : #accessing }
BioAbstractTest >> initMatrixRows: rowsNumber columns: columnsNumber [
	" Private - Initialize the receiver's matrix with rowsNumber and columnsNumber "
	
	self matrix: (self matrixClass rows: rowsNumber columns: columnsNumber)
]

{ #category : #running }
BioAbstractTest >> setUp [

	super setUp.
	BioException raiseWarning: false.
]

{ #category : #running }
BioAbstractTest >> tearDown [

	BioException raiseWarning: nil.
	super tearDown.
]

{ #category : #accessing }
BioAbstractTest >> testFilesFullDirectoryName [
	" Private - See comment in BioObject "

	^ BioObject testFilesFullDirectoryName
]
