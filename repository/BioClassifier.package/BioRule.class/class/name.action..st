instance creation
name: aString action: actionBlock

	^ self new
		name: aString;
		condition: actionBlock;
		yourself