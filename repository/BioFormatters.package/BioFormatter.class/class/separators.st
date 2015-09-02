utilities
separators
	" Answer a <Collection> with descriptions of invisible characters "

	^ self alphaCharacters
		addFirst: 'WHITESPACE';
		addFirst: 'TAB';
		addFirst: 'NONE';
		yourself.