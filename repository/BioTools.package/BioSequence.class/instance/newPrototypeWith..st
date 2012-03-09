accessing private
newPrototypeWith: aString
	" Private - Note that you cannot copy because Sequence objects are not mutable "
	
	^ self class 
			newWith: aString 
			alphabet: self alphabet