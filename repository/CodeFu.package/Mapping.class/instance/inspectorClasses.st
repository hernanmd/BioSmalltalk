user interface
inspectorClasses

	^self size > 10000
		ifTrue:
			[Array with: BasicInspector]
		ifFalse:
			[Array
				with: DictionaryInspector
				with: BasicInspector]