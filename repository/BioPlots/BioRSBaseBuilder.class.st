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

{ #category : #rendering }
BioRSBaseBuilder >> addBase: aBaseLetter [

	| label box labelWithBox |

	label := RSLabel text: aBaseLetter.
	box := RSBox new fromRectangle: label encompassingRectangle.
	box color: (self colorMap at: aBaseLetter ifAbsent: [ ^ self ]).
	labelWithBox := { box. label } asShape.
	self bases add: labelWithBox
]

{ #category : #rendering }
BioRSBaseBuilder >> addSequence: aBioSequence [

	aBioSequence addFromRSBuilder: self.
]

{ #category : #adding }
BioRSBaseBuilder >> addSequenceString: aString [ 

	aString do: [ : letter | self addBase: letter ]
]

{ #category : #rendering }
BioRSBaseBuilder >> bases [

	^ bases
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

{ #category : #rendering }
BioRSBaseBuilder >> fromAlignment: aBioAlignment [

	aBioAlignment do: [ : aBioSequence | 
		self addSequence: aBioSequence].
]

{ #category : #rendering }
BioRSBaseBuilder >> fromString: aString [
	"For testing purposes"

	aString do: [ : aLetter | self addBase: aLetter].
]

{ #category : #rendering }
BioRSBaseBuilder >> initialize [

	super initialize.
	bases := OrderedCollection new.
]

{ #category : #rendering }
BioRSBaseBuilder >> renderIn: canvas [

	canvas addAll: self bases
]