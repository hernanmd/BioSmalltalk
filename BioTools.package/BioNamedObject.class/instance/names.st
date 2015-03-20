accessing
names
	" Answer a <Collection> of receiver's names "

	^ names
		ifNil: [ names := (self preferredName = self nullName
					ifFalse: [ self nameClass with: self preferredName ]
					ifTrue: [ self nameClass with: self nullName ]) ]