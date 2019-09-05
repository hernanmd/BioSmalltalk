Class {
	#name : #BioA31Spec,
	#superclass : #Object,
	#instVars : [
		'notation',
		'isMandatory',
		'dataType',
		'defaultValue',
		'format',
		'range',
		'value',
		'modified'
	],
	#category : 'BioArlequin-Core'
}

{ #category : #'instance creation' }
BioA31Spec class >> newTitle: aString isMandatory: aBoolean defaultValue: anObject [
	" Answer a new instance of the receiver "
	
	^ self new
			notation: aString;
			isMandatory: aBoolean;
			dataType: anObject class;
			defaultValue: anObject;
			yourself			
]

{ #category : #'instance creation' }
BioA31Spec class >> newTitle: aString isMandatory: aBoolean defaultValue: anObject format: aFormatObject [
	" Answer a new instance of the receiver "

	^ self new
			notation: aString;
			isMandatory: aBoolean;
			dataType: aFormatObject class;
			defaultValue: anObject;
			format: aFormatObject;
			yourself 
]

{ #category : #'instance creation' }
BioA31Spec class >> newTitle: aString isMandatory: aBoolean defaultValue: anObject range: aRangeObject [
	" Answer a new instance of the receiver "

	^ self new
			notation: aString;
			isMandatory: aBoolean;
			dataType: anObject class;
			range: aRangeObject;
			defaultValue: anObject;
			yourself
]

{ #category : #accessing }
BioA31Spec >> contents [
	" Answer a String with a suitable representation for 
	the receiver's input format "
	
	^ String streamContents: [ : str | 
		str nextPutAll: self notation asString;
			nextPut: $=;
			nextPutAll: self value asString ]
]

{ #category : #accessing }
BioA31Spec >> dataType [
	"Answer the value of dataType"

	^ dataType
]

{ #category : #accessing }
BioA31Spec >> dataType: anObject [
	"Set the value of dataType"

	dataType := anObject
]

{ #category : #accessing }
BioA31Spec >> defaultValue [
	"Answer the value of defaultValue"

	^ defaultValue
]

{ #category : #accessing }
BioA31Spec >> defaultValue: anObject [
	"Set the value of defaultValue"

	defaultValue := anObject
]

{ #category : #accessing }
BioA31Spec >> format [
	^ format
]

{ #category : #accessing }
BioA31Spec >> format: anObject [
	format := anObject
]

{ #category : #accessing }
BioA31Spec >> isMandatory [
	"Answer the value of isMandatory"

	^ isMandatory
]

{ #category : #accessing }
BioA31Spec >> isMandatory: anObject [
	"Set the value of isMandatory"

	isMandatory := anObject
]

{ #category : #accessing }
BioA31Spec >> modified [
	"Answer the value of modified"

	^ modified
		ifNil: [ modified := false ]
]

{ #category : #accessing }
BioA31Spec >> modified: anObject [
	"Set the value of modified"

	modified := anObject
]

{ #category : #accessing }
BioA31Spec >> notation [
	"Answer the value of notation"

	^ notation
]

{ #category : #accessing }
BioA31Spec >> notation: anObject [
	"Set the value of notation"

	notation := anObject
]

{ #category : #printing }
BioA31Spec >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self class name;
		space;
		nextPut: $(;
		nextPutAll: self contents asString;
		nextPut: $)

	
]

{ #category : #accessing }
BioA31Spec >> range [
	^ range
]

{ #category : #accessing }
BioA31Spec >> range: anObject [
	range := anObject
]

{ #category : #testing }
BioA31Spec >> validate: anObject [
	" Answer true if the receiver may accept
	anObject as a valid value "
	
	^ self range isNil
		ifFalse: [ self range includes: anObject ]
		ifTrue: [ self defaultValue isKindOf: anObject class ]
]

{ #category : #evaluating }
BioA31Spec >> value [
	" Answer the receiver's value. If no value was set
	then use the receiver's default value "

	^ value
		ifNil: [ value := self defaultValue ]
]

{ #category : #evaluating }
BioA31Spec >> value: anObject [
	value := anObject
]
