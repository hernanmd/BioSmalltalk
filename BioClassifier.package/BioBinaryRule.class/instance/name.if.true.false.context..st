accessing
name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule context: aContextObject

	^ self name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		context: aContextObject;
		yourself