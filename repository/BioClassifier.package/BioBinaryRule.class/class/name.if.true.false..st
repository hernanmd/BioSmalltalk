instance creation
name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule

	^ self new
		name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		yourself