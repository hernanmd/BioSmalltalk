instance creation
name: aString if: conditionBlock true: trueRule false: falseRule

	^ self new
		name: aString;
		condition: conditionBlock;
		nextTrue: trueRule;
		nextFalse: falseRule;
		yourself