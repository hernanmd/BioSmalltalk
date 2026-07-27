"
I parse Newick (New Hampshire) format strings into BioPhyloTree objects. I am the hand-rolled fallback reader (supporting quoted labels); for plain Newick the faster SmaCC-generated BioNewickSmaCCParser is preferred.

  tree := BioPhyloNewickReader read: '((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);'.

BioPhyloTree class>>readFromNewick: routes through the SmaCC parser when available and falls back to me for quoted/NHX inputs.
"
Class {
	#name : 'BioPhyloNewickReader',
	#superclass : 'Object',
	#category : 'BioPhylogenetics-IO',
	#package : 'BioPhylogenetics',
	#tag : 'IO'
}

{ #category : 'reading' }
BioPhyloNewickReader class >> read: aString [	^ self new read: aString
]

{ #category : 'parsing' }
BioPhyloNewickReader >> parseChildFrom: aStream into: aClade [
	aClade addChild: (self parseSubtreeFrom: aStream)
]

{ #category : 'parsing' }
BioPhyloNewickReader >> parseLabelFrom: aStream [
	| ch done label |
	aStream atEnd ifTrue: [ ^ '' ].
	ch := aStream peek.
	ch = $' ifTrue: [ ^ self parseQuotedLabelFrom: aStream ].
	done := false. label := (String new: 16) writeStream.
	[ done not and: [ aStream atEnd not ] ] whileTrue: [
		ch := aStream peek.
		(ch = $, or: [ ch = $) or: [ ch = $: or: [ ch = $; or: [ ch = $( ] ] ] ])
			ifTrue: [ done := true ]
			ifFalse: [ label nextPut: aStream next ] ].
	^ label contents trim
]

{ #category : 'parsing' }
BioPhyloNewickReader >> parseNameAndLengthFrom: aStream into: aClade [
	"Parse a (possibly quoted) label, then optional :branchLength."
	| label |
	aStream atEnd ifTrue: [ ^ self ].
	aStream peek = $; ifTrue: [ ^ self ].
	aStream peek = $) ifTrue: [ ^ self ].
	label := self parseLabelFrom: aStream.
	label ifNotEmpty: [ aClade name: label ].
	aStream peek = $: ifTrue: [
		aStream next.
		aClade branchLength: (self parseNumberFrom: aStream) ].
]

{ #category : 'parsing' }
BioPhyloNewickReader >> parseNumberFrom: aStream [
	| num |
	num := (String new: 12) writeStream.
	[ aStream atEnd not and: [ aStream peek isDigit or: [ aStream peek = $. or: [ aStream peek = $- or: [ aStream peek = $e or: [ aStream peek = $E or: [ aStream peek = $+ ] ] ] ] ] ] ] whileTrue: [ num nextPut: aStream next ].
	^ num contents ifEmpty: [ 0.0 ] ifNotEmpty: [ :s | s asNumber ]
]

{ #category : 'parsing' }
BioPhyloNewickReader >> parseQuotedLabelFrom: aStream [
	"Read a single-quoted label, honoring doubled '' as an escaped quote."
	| label |
	aStream next.
	label := (String new: 16) writeStream.
	[ aStream atEnd not and: [ aStream peek ~= $' or: [ aStream peek ~= $' ] ] ] whileTrue: [ label nextPut: aStream next ].
	aStream peek = $' ifTrue: [ aStream next ].
	^ label contents
]

{ #category : 'parsing' }
BioPhyloNewickReader >> parseSubtreeFrom: aStream [
	| clade |
	clade := BioPhyloClade new.
	aStream peek = $(
		ifTrue: [
			aStream next.
			aStream atEnd not ifTrue: [ self parseChildFrom: aStream into: clade ].
			[ aStream atEnd not and: [ aStream peek = $, ] ] whileTrue: [
				aStream next.
				self parseChildFrom: aStream into: clade ].
			aStream peek = $) ifTrue: [ aStream next ] ].
	self parseNameAndLengthFrom: aStream into: clade.
	^ clade
]

{ #category : 'reading' }
BioPhyloNewickReader >> read: aString [
	"Parse a Newick (New Hampshire) string and answer a BioPhyloTree."
	| source tree |
	source := aString trim.
	(source isEmpty or: [ source last ~= $; ]) ifTrue: [ source := source , ';' ].
	tree := BioPhyloTree new.
	tree root: (self parseSubtreeFrom: (ReadStream on: source)).
	^ tree
]
