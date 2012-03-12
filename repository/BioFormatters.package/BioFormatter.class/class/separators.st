utilities
separators
	" Answer a Collection characters commonly used as
	separators, providing visible representation of invisible
	characters "

	^ self alphaCharacters
		addFirst: 'WHITESPACE';
		addFirst: 'TAB';
		addFirst: 'NONE';
		yourself.