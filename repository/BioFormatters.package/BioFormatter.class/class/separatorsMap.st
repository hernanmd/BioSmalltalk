utilities
separatorsMap
	" Answer a Collection characters commonly used as
	separators, providing visible representation of invisible
	characters and a corresponding value for processing input "

	| sMap |
	sMap := OrderedDictionary new.
	sMap 
		at: 'WHITESPACE' put: Character space asString;
		at: 'TAB' put: Character tab asString;
		at: 'NONE' put: nil;
		yourself.
	( self separators allButFirst: 3 ) do:[: strChar |
		sMap add: strChar -> strChar ].
	^ sMap
