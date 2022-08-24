Class {
	#name : #BioPHASECSVFormatter,
	#superclass : #BioCSVFormatter,
	#category : #'BioFormatters-Formatters-PHASE'
}

{ #category : #accessing }
BioPHASECSVFormatter class >> description [
	" See superimplementor's comment "

	^ 'INP (CSV) from PHASE Software'
]

{ #category : #examples }
BioPHASECSVFormatter class >> example1 [

	| inpFile |
	inpFile := BioPhaseINPFile new 
		file: 'inputFile.inp';
		headerLinesCount: 3;
		yourself.
	self new readFrom: inpFile.
]

{ #category : #accessing }
BioPHASECSVFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('INP')
]

{ #category : #initialize }
BioPHASECSVFormatter >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	self delimiterSourceCharacter: BioPhaseINPFile delimiter.
]

{ #category : #accessing }
BioPHASECSVFormatter >> isIDCCRow: row [
	" Answer <true> if row is used for identifying individuals and/or case/control status "
	
	^ row first beginsWith: '#' or: [ row second notNil and: [ row second beginsWith: '#' ] ]

]

{ #category : #accessing }
BioPHASECSVFormatter >> processGenotype: row [

	self subclassResponsibility
]

{ #category : #accessing }
BioPHASECSVFormatter >> readFrom: aFile [
	" Answer a <Collection> of genotype objects "

	parser := self newParserFor: aFile.
	aFile headerLinesCount timesRepeat: [ parser skipHeader ].
	parser rowsDo: [ : row | 
		(self isIDCCRow: row) 
			ifFalse: [ self processGenotype: row ] ].

]
