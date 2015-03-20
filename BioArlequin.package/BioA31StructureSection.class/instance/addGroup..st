accessing
addGroup: aString
	" Add aString to the receiver's groups "
	
	| groupNames |
	groupNames := self 
					at: self class groupId key
					ifAbsentPut: [ OrderedCollection new ].
	groupNames add: aString.