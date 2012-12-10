enumerating
documentTermCountDo: aBlock

	documents keysAndValuesDo: [ :document :terms |
		terms withCountDo: [ :term :count |
			aBlock 
				value: document 
				value: term
				value: count ]]