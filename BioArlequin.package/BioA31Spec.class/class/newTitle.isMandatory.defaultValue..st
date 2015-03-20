instance creation
newTitle: aString isMandatory: aBoolean defaultValue: anObject
	" Answer a new instance of the receiver "
	
	^ self new
			notation: aString;
			isMandatory: aBoolean;
			dataType: anObject class;
			defaultValue: anObject;
			yourself			