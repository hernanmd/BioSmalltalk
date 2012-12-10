instance creation
fromString: stopwords

	^self withAll: (stopwords runsFailing: #isSeparator)