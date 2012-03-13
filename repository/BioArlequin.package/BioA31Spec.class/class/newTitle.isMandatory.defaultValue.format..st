instance creation
newTitle: aString isMandatory: aBoolean defaultValue: anObject format: aFormatObject
	" Answer a new instance of the receiver "

	^ self new
			notation: aString;
			isMandatory: aBoolean;
			dataType: aFormatObject class;
			defaultValue: anObject;
			format: aFormatObject;
			yourself 