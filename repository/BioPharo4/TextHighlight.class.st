"
Definition of a clickable highlighted range of text with optional borders.
"
Class {
	#name : #TextHighlight,
	#superclass : #Object,
	#instVars : [
		'color',
		'lineRange',
		'borderWidth',
		'borderColor',
		'borderSides',
		'fillWidth',
		'lineHighligths',
		'textMorph'
	],
	#category : 'BioPharo4-Morphic'
}

{ #category : #'as yet unclassified' }
TextHighlight class >> on: aMorph [

	^ self basicNew
		textMorph: aMorph;
		initialize;
		yourself
]

{ #category : #accessing }
TextHighlight >> borderColor [
	"Answer the value of borderColor"

	^ borderColor
]

{ #category : #accessing }
TextHighlight >> borderColor: anObject [
	"Set the value of borderColor"

	borderColor := anObject.
	lineHighligths do: [:e | e borderColor: anObject ]
]

{ #category : #accessing }
TextHighlight >> borderSides [
	"Answer the value of borderSides"

	^ borderSides
]

{ #category : #accessing }
TextHighlight >> borderSides: anObject [
	"Set the value of borderSides"

	borderSides := anObject.
	lineHighligths do: [:e | e borderSides: anObject ]
]

{ #category : #accessing }
TextHighlight >> borderWidth [
	"Answer the value of borderWidth"

	^ borderWidth
]

{ #category : #accessing }
TextHighlight >> borderWidth: anObject [
	"Set the value of borderWidth"

	borderWidth := anObject.
	lineHighligths do: [:e | e borderWidth: anObject ]
]

{ #category : #event }
TextHighlight >> clicked: evt [
	"The receiver has had a mouse down."

	self triggerEvent: #clicked
]

{ #category : #accessing }
TextHighlight >> color [
	"Answer the value of color"

	^ color
]

{ #category : #accessing }
TextHighlight >> color: anObject [
	"Set the value of color"

	color := anObject.
	lineHighligths do: [:e | e color: anObject ]
]

{ #category : #testing }
TextHighlight >> containsPoint: aPoint in: rect [
	"Answer whther the bounds contain the given (local coordinate) point."

	^ lineHighligths anySatisfy: [:e | e containsPoint: aPoint in: rect ]
]

{ #category : #draw }
TextHighlight >> drawOn: aCanvas in: rect offset: o [
	"Draw the highlight on the given canvas for the given rectangle."

	self setLineHighLights.
	lineHighligths do: [:e | e drawOn: aCanvas in: rect offset: o ]
]

{ #category : #accessing }
TextHighlight >> fillWidth [
	"Answer the value of fillWidth"

	^ fillWidth
]

{ #category : #accessing }
TextHighlight >> fillWidth: anObject [
	"Set the value of fillWidth"

	fillWidth := anObject.
	lineHighligths do: [:e | e fillWidth: anObject ]
]

{ #category : #initialization }
TextHighlight >> initialize [
	"Initialize the receiver."

	super initialize.
	lineHighligths := #().
	self
		color: Color yellow;
		lineRange: (1 to: 0);
		borderWidth: 0;
		borderColor: Color transparent;
		borderSides: #(top right bottom left);
		fillWidth: false
]

{ #category : #accessing }
TextHighlight >> lineNumber [

	^ self textMorph textMorph paragraph lineIndexOfCharacterIndex: self lineRange first
]

{ #category : #accessing }
TextHighlight >> lineRange [
	"Answer the value of lineRange"

	^ lineRange
]

{ #category : #accessing }
TextHighlight >> lineRange: anObject [
	"Set the value of lineRange"

	lineRange := anObject.
	lineHighligths := Set new.
	
	self setLineHighLights.
]

{ #category : #private }
TextHighlight >> newLineHighlight [

	^ TextHighlightByBounds new
		borderWidth: self borderWidth;
		borderColor: self borderColor;
		color: self color;
		fillWidth: self fillWidth
]

{ #category : #private }
TextHighlight >> setLineHighLights [

	"yes, i know ..."
	| anInterval paragraph firstLineIndex lastLineIndex |
	
	lineHighligths removeAll.
	anInterval := self lineRange.
	paragraph := self textMorph textMorph paragraph.
	firstLineIndex := paragraph lineIndexOfCharacterIndex: anInterval first.
	lastLineIndex := paragraph lineIndexOfCharacterIndex: anInterval last.
	
	firstLineIndex to: lastLineIndex do: [:i || line bounds offset1 offset2 right text subtext tabs |
		line := paragraph lines at: i.
		text := self textMorph text.
		subtext := text copyFrom: line first to: line last.
		tabs := subtext occurrencesOf: Character tab.
		right := (self textMorph font widthOfString: subtext) + (tabs * ((8*(self textMorph font widthOf:Character space))-6)).
		offset1 := 0.
		offset2 := 0.
		(i = firstLineIndex) ifTrue: [ offset1 := self textMorph font widthOfString: (text copyFrom: line first to: ((anInterval first -1)max: 1)) ].
		(i = lastLineIndex) ifTrue: [ offset2 := self textMorph font widthOfString: (text copyFrom: (anInterval last min: text size) to: line last) ].
		
		bounds := (line left+offset1)@line top corner: (right - offset2)@line bottom.		
		lineHighligths add: (self newLineHighlight
								bounds: bounds) ]
]

{ #category : #accessing }
TextHighlight >> textMorph [

	^ textMorph
]

{ #category : #accessing }
TextHighlight >> textMorph: aMorph [

	textMorph := aMorph
]
