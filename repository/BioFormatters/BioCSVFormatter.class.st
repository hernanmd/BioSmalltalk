"
Abstract class for CSV format writers

"
Class {
	#name : #BioCSVFormatter,
	#superclass : #BioFileFormatter,
	#category : 'BioFormatters-Formatters-CSV'
}

{ #category : #accessing }
BioCSVFormatter class >> description [
	" See superimplementor's comment "

	^ 'Generic CSV'
]

{ #category : #accessing }
BioCSVFormatter class >> formatExtension [
	" Private - Answer a String corresponding for the receiver's file output format "

	^ 'csv'
]

{ #category : #accessing }
BioCSVFormatter class >> identifiers [
	" See superimplementor's comment "

	^ #('CSV' 'Comma Separated Values' 'Comma Delimited File' 'Tab Delimited File')
]

{ #category : #accessing }
BioCSVFormatter >> exportFrom: aCollection [
	" Iterate aCollection storing the corresponding CSV format for each item. Output the resulting stream in a new timestamped file in the receiver's directory "
	
	self initializeStream: aCollection.
	aCollection do: [: each |
			each dumpCSVTo: stream.
			stream cr ].
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: stream contents
]

{ #category : #accessing }
BioCSVFormatter >> fileNamePrefix [
	" Answer a default prefix <String> for the output file name "
	
	^ 'BioST-Export-CSV_'
]

{ #category : #accessing }
BioCSVFormatter >> newParserFor: filePath [
	" Answer a new CSV parser "

	^ (self parserClass on: (self openFullFileNamed: filePath) readStream)
		separator: self delimiter; 
		yourself
]

{ #category : #accessing }
BioCSVFormatter >> parserClass [ 
	" Answer a default parser class "

	^ NeoCSVReader
]

{ #category : #accessing }
BioCSVFormatter >> parserOn: aString [

	^ (self parserClass on: (ReadStream on: aString))
			parser delimiter: $;;
			ignoreHeaderLine;
			yourself.
]

{ #category : #accessing }
BioCSVFormatter >> validate: aCollection [ 
	" See superimplementor's comment "
	
	isValid := aCollection allSatisfy: [ : item | item isValidForCSVFormat ].
	super validate: aCollection

]
