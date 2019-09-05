"
bigBed format supports for very large (over 50 Mbytes) BED files.

    Instance Variables
	dataLinesCount:		<Number>		Count of the lines added to the formatter


"
Class {
	#name : #BioBigBEDFormatter,
	#superclass : #BioBEDFormatter,
	#instVars : [
		'dataLinesCount'
	],
	#category : 'BioFormatters-Formatters-BED'
}

{ #category : #accessing }
BioBigBEDFormatter >> addCFChr: chrString start: chrStart end: chrEnd [
	" See superimplementor's comment.
	Count the lines added to the receiver "

	super addCFChr: chrString start: chrStart end: chrEnd.
	self dataLinesCount: self dataLinesCount + 1
]

{ #category : #accessing }
BioBigBEDFormatter >> addCFLineChr: chrString start: chrStart end: chrEnd [
	" See superimplementor's comment.
	Count the lines added to the receiver "

	super addCFLineChr: chrString start: chrStart end: chrEnd.
	self dataLinesCount: self dataLinesCount + 1
]

{ #category : #accessing }
BioBigBEDFormatter >> dataLinesCount [
	" Answer a <Number> with the count of the data lines in the receiver "

	^ dataLinesCount
		ifNil: [ dataLinesCount := 0 ]
]

{ #category : #accessing }
BioBigBEDFormatter >> dataLinesCount: anObject [
	dataLinesCount := anObject
]

{ #category : #accessing }
BioBigBEDFormatter >> fileNamePrefix [
	" Answer a default prefix <String> for the output file name "
	
	^ super fileNamePrefix , 'Big_'
]
