accessing
frequencyOf: term in: document

	^matrix at: (termMap atValue: term) and: (documentMap atValue: document)