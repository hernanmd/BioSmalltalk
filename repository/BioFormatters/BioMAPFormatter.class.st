"
Reader/writer for format MAP, as described by the PLINK software.

"
Class {
	#name : #BioMAPFormatter,
	#superclass : #BioFileFormatter,
	#category : 'BioFormatters-Formatters'
}

{ #category : #accessing }
BioMAPFormatter class >> description [
	" Private - See superimplementor's comment "

	^ 'MAP Writer'
]

{ #category : #examples }
BioMAPFormatter class >> exampleReadMAP1 [

	^ (self newFromInputFile: 
		(self testFilesDirectoryName asFileReference / 'pedmap' / 'sample_ped.map') fileName)
			positions.
]

{ #category : #accessing }
BioMAPFormatter class >> formatExtension [
	" Private - Answer a <String> corresponding for the receiver's file output format "

	^ 'map'

]

{ #category : #accessing }
BioMAPFormatter class >> identifiers [
	" See superimplementor's comment "
	
	^ #('MAP')
]

{ #category : #private }
BioMAPFormatter >> buildMapArray [

	^ (NeoCSVReader on: (self inputFile asFileReference tailn: 5) readStream)
		separator: Character tab;
		addField;
		addField;
		addFloatField;
		addIntegerField;
		upToEnd.
]

{ #category : #accessing }
BioMAPFormatter >> positions [
	" Answer a <Collection> of <Integer> with positions read by the receiver's file "
	
	^ self buildMapArray
]

{ #category : #accessing }
BioMAPFormatter >> removeLinesWithChrGreaterThan: n [
	" Sort records by chromosome position. Answer a new instance of the receiver. This is similar to evaluating the shell command :

	$ awk '($1 > 30)' Bo1.map > test1 "

	^ self shouldBeImplemented 
]

{ #category : #accessing }
BioMAPFormatter >> sortByChromosome [
	" Sort records by chromosome number. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	$ sort -t$'\t' -k 1,1n ""$inputFile"" > ""$inputFile.out"

	^ self sortByField: 1.
]

{ #category : #private }
BioMAPFormatter >> sortByField: aNumber [
	" Sort records by chromosome number. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	$ sort -t$'\t' -k 1,1n ""$inputFile"" > ""$inputFile.out"

	| mapArray sortedMap |
	mapArray := self buildMapArray.
	sortedMap := mapArray asSortedCollection: [ : fieldA : fieldB | (fieldA at: aNumber) < (fieldB at: aNumber) ].
	^ sortedMap
]

{ #category : #accessing }
BioMAPFormatter >> sortByPosition [
	" Sort records by chromosome position. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	$ sort -t$'\t' -k 4,4n ""$inputFile"" > ""$inputFile.out"

	^ self sortByField: 4.
]
