Class {
	#name : #BioRSBaseBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'bases'
	],
	#category : #BioPlots
}

{ #category : #examples }
BioRSBaseBuilder class >> example1 [
	
	BioRSBaseBuilder new
	fromString: 'ACTGCTAGCTAG
ACT-CTAGCTAG
ACTGGTANATGG
ACTGATTGCTGG
ACTGCTTGATTG';
	open.
]

{ #category : #adding }
BioRSBaseBuilder >> addBase: aBaseLetter rowIndex: rowIndex colIndex: colIndex [ 

	| label labelWithBox extent |

	label := RSLabel text: aBaseLetter.
	extent := 10 @ 15.
	label fontFamily: 'Serif'.
	labelWithBox := { label } asShape
			color: (self colorMap at: aBaseLetter ifAbsent: [ ^ self ]);
			extent: extent;
			position: extent * (colIndex @ rowIndex);
			yourself.
	self bases add: labelWithBox
]

{ #category : #adding }
BioRSBaseBuilder >> addSequence: aBioSequence rowIndex: anInteger [ 

	aBioSequence addFromRSBuilder: self rowIndex: anInteger.
]

{ #category : #adding }
BioRSBaseBuilder >> addSequenceString: aString rowIndex: anInteger [ 

	aString doWithIndex: [ : letter : col | self addBase: letter rowIndex: anInteger colIndex: col ]
]

{ #category : #rendering }
BioRSBaseBuilder >> bases [

	^ bases
]

{ #category : #accessing }
BioRSBaseBuilder >> bases: anObject [

	bases := anObject
]

{ #category : #rendering }
BioRSBaseBuilder >> colorMap [

	^ { 
		$A -> Color red .
		$C -> Color green .
		$T -> Color blue .
		$G -> Color yellow .
		$- -> Color white .
		$N -> Color black
		} asDictionary
]

{ #category : #'accessing - defaults' }
BioRSBaseBuilder >> defaultContainer [ 

	| canvasController |
	
	canvasController := RSCanvasController simple.
	^ RSCanvas new
		addInteraction: canvasController;
		yourself
]

{ #category : #rendering }
BioRSBaseBuilder >> fromAlignment: aBioAlignment [

	aBioAlignment doWithIndex: [ : aBioSequence : row | 
		self addSequence: aBioSequence rowIndex: row ].
]

{ #category : #rendering }
BioRSBaseBuilder >> fromString: aString [
	"For testing purposes"

	aString lines doWithIndex: [ : aBioSequence : row | 
		self addSequence: aBioSequence rowIndex: row ].
]

{ #category : #initialization }
BioRSBaseBuilder >> initialize [

	super initialize.
	bases := OrderedCollection new.
]

{ #category : #rendering }
BioRSBaseBuilder >> renderIn: canvas [

	canvas addAll: self bases.
]
