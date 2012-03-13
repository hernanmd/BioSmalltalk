initialize-release
initializeWith: aNameString
	" Private - Initialize receive's settings "
	
	name := aNameString.
	preferences := BioUserPreferences newFor: self.
	self addApplicationUser: self 