accessing
export
	" Write contents to receiver's output file "
	
	self isValid 
		ifFalse: [ self informMessage: 'Current configuration is not valid for ' , self description , ' format' ]
		ifTrue: [ self exportFrom: self samples ]