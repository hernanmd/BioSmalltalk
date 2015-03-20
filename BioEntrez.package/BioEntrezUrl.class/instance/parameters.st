accessing
parameters
	" Answer a Collection with the receiver's parameter names "

"	| dbString |
	dbString := self path last findTokens: self urlTokens.
	^ dbString select: [ : par | self entrezParameters includes: par ]"
	^ self hasQuery 
		ifTrue: [ self query keys ]
		ifFalse: [ Array new ]