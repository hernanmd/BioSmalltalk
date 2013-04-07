*biopharo
instVarFieldList

	^ self baseFieldList ,
		(object size <= (self i1 + self i2)
			ifTrue: [ (1 to: object size)
						collect: [ : i | i printString]]
			ifFalse: [ (1 to: self i1) , (object size - (self i2 - 1) to: object size)
						collect: [ : i | i printString]])