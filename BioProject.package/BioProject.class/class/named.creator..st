instance creation
named: aNameString creator: aBioUser
	" Answer a new instance of the receiver setting its name to aNameString and its creator as aBioUser "

	| newInstance |
	newInstance := self new.
	newInstance
		initializeWith: aNameString 
		creator: aBioUser.
	^ newInstance