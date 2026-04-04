Class {
	#name : 'BioREBASEParser',
	#superclass : 'BioAbstractParser',
	#category : 'BioParsers-Restriction',
	#package : 'BioParsers',
	#tag : 'Restriction'
}

{ #category : 'accessing' }
BioREBASEParser >> parse: aStream [
	"Parse REBASE emboss_e.dat format.
	Example format:
	# Name  Site  Cut5  Cut3
	EcoRI	GAATTC	1	5
	"

	| line |
	[ aStream atEnd ] whileFalse: [
			line := aStream nextLine.
			(line beginsWith: '#') ifFalse: [
					| tokens |
					tokens := line findTokens: Character tab asString.
					tokens size >= 4 ifTrue: [
							| enzyme |
							enzyme := BioRestrictionEnzyme new.
							enzyme name: (tokens at: 1).
							enzyme site: (tokens at: 2).
							enzyme cut5: (tokens at: 3) asInteger.
							enzyme cut3: (tokens at: 4) asInteger.
							BioRestrictionEnzyme register: enzyme ] ] ]
]
