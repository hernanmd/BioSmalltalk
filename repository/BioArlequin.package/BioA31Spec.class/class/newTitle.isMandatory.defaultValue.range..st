instance creation
newTitle: aString isMandatory: aBoolean defaultValue: anObject range: aRangeObject
	" Answer a new instance of the receiver "

	^ self new
			notation: aString;
			isMandatory: aBoolean;
			dataType: anObject class;
			range: aRangeObject;
			defaultValue: anObject;
			yourself