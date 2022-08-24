"
Abstract class for a INI file section corresponding to the Arlequin 3.1 input file format

- Send `#configurationAt:` to obtain the specification at the parameter setting.
- Send `#at:` to obtain the value at that setting.
- configurationAt:	Support for getting default values and validate properties.
  - Each time a setting is read, this message is sent to get the default value.
  - Each time a setting is written, this meesage is sent to check if the value corresponding that setting is valid with its specification found in the class side.
- `sectionSpecs` are specifications to validate settings.
"
Class {
	#name : #BioA31INISection,
	#superclass : #INIFileSection,
	#category : #'BioArlequin-Sections'
}

{ #category : #accessing }
BioA31INISection class >> classFor: aString [

	^ self allSubclasses detect: [ : c | c matches: aString ]
]

{ #category : #accessing }
BioA31INISection class >> matches: aString [

	^ self notationSection = aString or: [ self notation = aString ]
]

{ #category : #accessing }
BioA31INISection class >> notationSection [

	^ self notation trimBoth: [ : each | each = $[ or: [ each = $] ] ]
]

{ #category : #accessing }
BioA31INISection >> at: keyString [

	^ self
		  at: (self realKey: keyString)
		  ifAbsent: [ self error: 'No value specified for key in section' ]
]

{ #category : #accessing }
BioA31INISection >> at: keyString ifAbsentPut: aFullBlockClosure [

	| realKey |
	realKey := self realKey: keyString.
	^ self at: realKey ifAbsent: [ 
		  self at: realKey put: aFullBlockClosure value ]
]

{ #category : #accessing }
BioA31INISection >> at: keyString put: valueString [

	^ self iniFile
		  section: self label
		  at: (self realKey: keyString)
		  put: valueString
]

{ #category : #accessing }
BioA31INISection >> configurationAt: aConfigurationString [ 
	" Private - Answer the receiver's configuration identified by aConfigurationString "
	
	^ self sectionSpecs 
			detect: [ : specConf | specConf notation key = aConfigurationString key ] 
			ifNone: [ self error: aConfigurationString key , ' configuration not found' translated ].

]

{ #category : #accessing }
BioA31INISection >> realKey: keyString [

	^ keyString isVariableBinding
		  ifTrue: [ keyString key ]
		  ifFalse: [ keyString ]
]

{ #category : #accessing }
BioA31INISection >> sectionSpecs [
	"Answer a <Collection> of <BioA31Spec>"

	^ self class sectionSpecs
]

{ #category : #private }
BioA31INISection >> shouldQuote: aString [
	" Answer <true> if aString value should be written between quotes "

	^ #( 
	'SampleName'
	'Title'
	'MatrixData'
	'MissingData'
	'MatrixName'
	'StructureName'	
	'HaplListName' ) includes: aString
]

{ #category : #writing }
BioA31INISection >> shouldWriteLabelOn: aStream [
	" Private - Answer <true> if receiver should write the label in aStream "

	^ self label isString not and: [ (aStream copy contents includesSubstring: self class notation) not ]
]

{ #category : #writing }
BioA31INISection >> writeLabelOn: aStream [

	aStream
		nextPutAll: self label between: $[ and: $];
		nextPutTerminator
]

{ #category : #private }
BioA31INISection >> writeOn: aStream [
	" Private - Write the receiver's title and key/value pairs in aStream "
	
	self writeLabelOn: aStream.
	self associationsDo: [ :assoc | 
		aStream 
			tab;
			nextPutAll: assoc key;
			nextPut: $=.
		self writeQuoted: assoc on: aStream ]
]

{ #category : #writing }
BioA31INISection >> writeQuoted: assoc on: aStream [

	(self shouldQuote: assoc key)
		ifTrue: [ aStream nextPutAll: (assoc value ifNil: [ '' ]) forArlequinValue ]
		ifFalse: [ aStream nextPutAll: (assoc value asString ifNil: [ '' ]) ].
	aStream nextPutTerminator
]
