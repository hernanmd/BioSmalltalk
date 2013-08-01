private
updateDisplayName

	| opString |
	opString := self operator isNil
		ifTrue: [  ' ? ' ]
		ifFalse: [ ' ' , self operator , ' ' ].
	self displayName: self propertyName1 , opString , self propertyName2.
