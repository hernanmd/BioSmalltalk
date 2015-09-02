accessing
export
	" Write contents to receiver's output file "
	
	isValid 
		ifFalse: [ self informMessage: 'Current configuration is not valid for ' , self description , ' format' ]
		ifTrue: [ self exportFrom: self inputStream ]