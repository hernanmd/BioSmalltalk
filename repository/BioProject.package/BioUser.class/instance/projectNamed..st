accessing projects
projectNamed: aNameString
	" Answer a BioProject named aNameString or raise an exception if not found "
	
	^ ( self projectINamed: aNameString ) project