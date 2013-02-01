initialize-release
initializeComparators
	" Private - Initialize comparison selectors with descriptions "

	self comparators: (OrderedDictionary new
		at: '#=' 							put: 'Is Equal';
		at: '#isEqualCaseSensitive' 		put: 'Is Equal (case-sensitive)';
		at: '#~=' 							put: 'Is Not Equal';
		at: '#isNotEqualCaseSensitive' 		put: 'Is Not Equal (case-sensitive)';
		at: '#beginsWith:'					put: 'Begins With';
		at: '#beginsWithCaseSensitive:'	put: 'Begins With  (case-sensitive)';
		at: '#endsWith:'					put: 'Ends With  (case-sensitive)';
		at: '#endsWith:'					put: 'Ends With:';
		at: '#>' 							put: 'Is Greater';
		at: '#<' 							put: 'Is Lesser';
		at: '#>=' 							put: 'Is Greater or Equal';
		at: '#<=' 							put: 'Is Lesser or Equal';
		at: '#includes:' 						put: 'Contains';
		at: '#includesCaseSensitive:' 		put: 'Contains  (case-sensitive)';
		at: '#includesNot:' 					put: 'Contains Not';
		at: '#includesNotaseSensitive:' 	put: 'Contains Not (case-sensitive)';
		at: '#matchesRegex:' 				put: 'Regex';
		yourself).
	^ self comparators