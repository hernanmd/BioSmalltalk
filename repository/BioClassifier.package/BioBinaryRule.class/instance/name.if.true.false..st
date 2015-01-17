accessing
name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule

	^ self name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		yourself