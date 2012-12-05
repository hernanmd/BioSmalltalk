accessing
generateClasses
	" Private - Generate receiver's classes "

	self parser rowsDo: [: row | 
		| methods |

		self buildClassNames: row.
		methods := row second findTokens: ','.
		self generateMethods: methods source: methods.
		self targetSelector: 'url';
				 sourceString: row third;
				 generateMethod ]

