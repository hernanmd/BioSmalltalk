"
SmaCC-based parser for PDB format files. Parses PDB records into structured objects.
"
Class {
	#name : 'BioPDBSmaCCParser',
	#superclass : 'SmaCCParser',
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'instance creation' }
BioPDBSmaCCParser class >> on: aStream [
	^ self new scanner: (BioPDBScanner on: aStream); yourself
]

{ #category : 'instance creation' }
BioPDBSmaCCParser class >> parseFile: aFilePath [
	| stream parser |
	stream := aFilePath asFileReference readStream.
	parser := self on: stream.
	^ parser parse
]

{ #category : 'instance creation' }
BioPDBSmaCCParser class >> parseString: aString [
	^ self on: aString readStream
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parse [
	| file atoms seqRes records line |
	file := BioPDBFile new.
	atoms := OrderedCollection new.
	seqRes := OrderedCollection new.
	records := OrderedCollection new.
	
	[ scanner stream atEnd ] whileFalse: [
		line := scanner stream nextLine.
		line ifNotNil: [
			line := line trimRight.
			line ifNotEmpty: [
				| record |
				record := self parseLine: line.
				record ifNotNil: [
					records add: record.
					record isAtomRecord ifTrue: [ atoms add: record ].
					record isSeqResRecord ifTrue: [ seqRes add: record ] ] ] ] ].
	
	file atoms: atoms.
	file seqResRecords: seqRes.
	file records: records.
	^ file
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseAtom: aLine [
	| record |
	record := BioPDBAtomRecord new.
	record recordType: 'ATOM'.
	record line: aLine.
	record serialNumber: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 7 to: 11)).
	record atomName: (self safeStringFromLine: aLine from: 13 to: 16).
	record altLoc: (self safeStringFromLine: aLine from: 17 to: 17).
	record resName: (self safeStringFromLine: aLine from: 18 to: 20).
	record chainID: (self safeStringFromLine: aLine from: 22 to: 22).
	record resSeq: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 23 to: 26)).
	record iCode: (self safeStringFromLine: aLine from: 27 to: 27).
	record x: (self safeNumberFromString: (self safeStringFromLine: aLine from: 31 to: 38)).
	record y: (self safeNumberFromString: (self safeStringFromLine: aLine from: 39 to: 46)).
	record z: (self safeNumberFromString: (self safeStringFromLine: aLine from: 47 to: 54)).
	record occupancy: (self safeNumberFromString: (self safeStringFromLine: aLine from: 55 to: 60)).
	record tempFactor: (self safeNumberFromString: (self safeStringFromLine: aLine from: 61 to: 66)).
	record element: (self safeStringFromLine: aLine from: 77 to: 78).
	record charge: (self safeStringFromLine: aLine from: 79 to: 80).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseAuthor: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'AUTHOR'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseCompnd: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'COMPND'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseConect: aLine [
	| record nums |
	record := BioPDBConectRecord new.
	record recordType: 'CONECT'.
	record line: aLine.
	record serialNumber: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 7 to: 11)).
	nums := (self safeStringFromLine: aLine from: 12 to: 31) substrings: ' '.
	record bondedAtoms: (nums collect: [:n | self safeIntegerFromString: n]).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseDbref: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'DBREF'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseEnd: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'END'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseEndmdl: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'ENDMDL'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseExpdta: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'EXPDTA'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseHeader: aLine [
	| record |
	record := BioPDBHeaderRecord new.
	record recordType: 'HEADER'.
	record line: aLine.
	record classification: (self safeStringFromLine: aLine from: 11 to: 50).
	record depositionDate: (self safeStringFromLine: aLine from: 51 to: 59).
	record idCode: (self safeStringFromLine: aLine from: 63 to: 66).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseHelix: aLine [
	| record |
	record := BioPDBHelixRecord new.
	record recordType: 'HELIX'.
	record line: aLine.
	record serialNumber: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 8 to: 10)).
	record helixID: (self safeStringFromLine: aLine from: 12 to: 14).
	record initResName: (self safeStringFromLine: aLine from: 16 to: 18).
	record initChainID: (self safeStringFromLine: aLine from: 20 to: 20).
	record initSeqNum: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 22 to: 25)).
	record initICode: (self safeStringFromLine: aLine from: 26 to: 26).
	record endResName: (self safeStringFromLine: aLine from: 28 to: 30).
	record endChainID: (self safeStringFromLine: aLine from: 32 to: 32).
	record endSeqNum: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 34 to: 37)).
	record endICode: (self safeStringFromLine: aLine from: 38 to: 38).
	record helixClass: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 39 to: 40)).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseHetatm: aLine [
	| record |
	record := self parseAtom: aLine.
	record recordType: 'HETATM'.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseJrnl: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'JRNL'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseKeywds: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'KEYWDS'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseLine: aLine [
	| recordType |
	aLine size < 6 ifTrue: [ ^ nil ].
	recordType := (aLine copyFrom: 1 to: 6) trimRight.
	recordType = 'HEADER' ifTrue: [ ^ self parseHeader: aLine ].
	recordType = 'TITLE' ifTrue: [ ^ self parseTitle: aLine ].
	recordType = 'COMPND' ifTrue: [ ^ self parseCompnd: aLine ].
	recordType = 'SOURCE' ifTrue: [ ^ self parseSource: aLine ].
	recordType = 'KEYWDS' ifTrue: [ ^ self parseKeywds: aLine ].
	recordType = 'EXPDTA' ifTrue: [ ^ self parseExpdta: aLine ].
	recordType = 'AUTHOR' ifTrue: [ ^ self parseAuthor: aLine ].
	recordType = 'REVDAT' ifTrue: [ ^ self parseRevdat: aLine ].
	recordType = 'JRNL' ifTrue: [ ^ self parseJrnl: aLine ].
	recordType = 'REMARK' ifTrue: [ ^ self parseRemark: aLine ].
	recordType = 'DBREF' ifTrue: [ ^ self parseDbref: aLine ].
	recordType = 'SEQRES' ifTrue: [ ^ self parseSeqRes: aLine ].
	recordType = 'HELIX' ifTrue: [ ^ self parseHelix: aLine ].
	recordType = 'SHEET' ifTrue: [ ^ self parseSheet: aLine ].
	recordType = 'TURN' ifTrue: [ ^ self parseTurn: aLine ].
	recordType = 'SITE' ifTrue: [ ^ self parseSite: aLine ].
	recordType = 'ATOM' ifTrue: [ ^ self parseAtom: aLine ].
	recordType = 'HETATM' ifTrue: [ ^ self parseHetatm: aLine ].
	recordType = 'CONECT' ifTrue: [ ^ self parseConect: aLine ].
	recordType = 'END' ifTrue: [ ^ self parseEnd: aLine ].
	recordType = 'ENDMDL' ifTrue: [ ^ self parseEndmdl: aLine ].
	recordType = 'MODEL' ifTrue: [ ^ self parseModel: aLine ].
	^ BioPDBRecord new recordType: recordType; line: aLine; yourself
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseModel: aLine [
	| record |
	record := BioPDBModelRecord new.
	record recordType: 'MODEL'.
	record line: aLine.
	record serialNumber: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 11 to: 14)).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseRemark: aLine [
	| record |
	record := BioPDBRemarkRecord new.
	record recordType: 'REMARK'.
	record line: aLine.
	record remarkNumber: (self safeStringFromLine: aLine from: 8 to: 10).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseRevdat: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'REVDAT'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseSeqRes: aLine [
	| record |
	record := BioPDBSeqResRecord new.
	record recordType: 'SEQRES'.
	record line: aLine.
	record serialNumber: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 8 to: 10)).
	record chainID: (self safeStringFromLine: aLine from: 12 to: 12).
	record numResidues: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 14 to: 17)).
	record residues: ((self safeStringFromLine: aLine from: 20 to: 70) substrings: ' ').
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseSheet: aLine [
	| record |
	record := BioPDBSheetRecord new.
	record recordType: 'SHEET'.
	record line: aLine.
	record strandNumber: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 8 to: 10)).
	record sheetID: (self safeStringFromLine: aLine from: 12 to: 14).
	record numStrands: (self safeIntegerFromString: (self safeStringFromLine: aLine from: 15 to: 16)).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseSite: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'SITE'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseSource: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'SOURCE'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseTitle: aLine [
	| record |
	record := BioPDBTitleRecord new.
	record recordType: 'TITLE'.
	record line: aLine.
	record continuationNumber: (self safeStringFromLine: aLine from: 9 to: 10).
	record title: (self safeStringFromLine: aLine from: 11 to: 80).
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> parseTurn: aLine [
	| record |
	record := BioPDBRecord new.
	record recordType: 'TURN'.
	record line: aLine.
	^ record
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> safeIntegerFromString: aString [
	| trimmed |
	trimmed := aString trimBoth.
	trimmed ifEmpty: [ ^ 0 ].
	^ trimmed asInteger
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> safeNumberFromString: aString [
	| trimmed |
	trimmed := aString trimBoth.
	trimmed ifEmpty: [ ^ 0 ].
	^ trimmed asNumber
]

{ #category : 'parsing' }
BioPDBSmaCCParser >> safeStringFromLine: aLine from: start to: end [
	| size |
	size := aLine size.
	start > size ifTrue: [ ^ '' ].
	^ (aLine copyFrom: start to: (end min: size)) trimBoth
]
