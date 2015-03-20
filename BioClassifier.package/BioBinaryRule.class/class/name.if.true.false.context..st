instance creation
name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule context: aContextObject

	^ self new
		name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		context: aContextObject;
		yourself