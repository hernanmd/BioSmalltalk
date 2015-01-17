instance creation
name: aString action: actionBlock context: aContext

	^ self new
		name: aString;
		condition: actionBlock;
		context: aContext;
		yourself