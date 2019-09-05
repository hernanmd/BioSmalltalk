"
A CSV file is a Comma-Separated Value file format used to store tabular data in plain text form.

To create a CSVFile specify the full path string:

| myCsv |
myCsv := BioCSVFile on: 'c:\myFiles\Test001.csv'.

To configure for ignoring the first 4 lines on read (the default is NOT to ignore any header line):

myCsv ignoreLinesCount: 4.

To configure for ignoring the last 3 lines on read (the default is NOT to ignore any last line):

myCsv ignoreLastLines.
myCsv ignoreLinesCount: 3.
"
Class {
	#name : #BioCSVFile,
	#superclass : #BioFile,
	#instVars : [
		'ignoreLinesStrategy',
		'ignoreLinesCount',
		'lines'
	],
	#category : 'BioFormatters-Formatters-CSV'
}

{ #category : #testing }
BioCSVFile class >> isValidFile: aFilename [
	" Answer <true> if aFilename is valid for the receiver "

	^ (super isValidFile: aFilename) and: [ aFilename endsWith: '.csv' ]
]

{ #category : #accessing }
BioCSVFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'CSV'
]

{ #category : #'initialize-release' }
BioCSVFile >> defaultIgnoreLinesStrategy [
	" Set the receiver's read strategy to skip headers "
	
	ignoreLinesStrategy := #ignoreHeadersCount:

]

{ #category : #'initialize-release' }
BioCSVFile >> ignoreFirstLines [

	ignoreLinesStrategy := #ignoreHeadersCount:
]

{ #category : #'initialize-release' }
BioCSVFile >> ignoreLastLines [

	ignoreLinesStrategy := #ignoreLastLinesCount:
]

{ #category : #accessing }
BioCSVFile >> ignoreLinesCount [
	^ ignoreLinesCount
]

{ #category : #accessing }
BioCSVFile >> ignoreLinesCount: anObject [
	ignoreLinesCount := anObject
]

{ #category : #accessing }
BioCSVFile >> ignoreLinesStrategy [
	^ ignoreLinesStrategy
]

{ #category : #accessing }
BioCSVFile >> ignoreLinesStrategy: anObject [
	ignoreLinesStrategy := anObject
]

{ #category : #'initialize-release' }
BioCSVFile >> initialize [
	" Private - Initialize the receiver's default parameters "

	super initialize.
	self ignoreLinesCount: 0.
	self ignoreLinesStrategy: self defaultIgnoreLinesStrategy.

]

{ #category : #accessing }
BioCSVFile >> lines [
	" Answer the number of lines in the receiver "
	
	^ lines

]

{ #category : #accessing }
BioCSVFile >> lines: anInteger [
	" For efficency reasons, instead of counting the lines in the receiver, set the number manually to anInteger "

	lines := anInteger
]
