private
testFindMinimum

	| value2 foundA02 foundB02 column0 temp row0 |
	self findMinimum.
	value2 := value. foundA02 := foundA0. foundB02  := foundB0.
	value := Float infinity.
	2 to: indices size do: [ :column |
		column0 := indices at: column.
		1 to: (column - 1) do: [ :row |
			temp := (partialColumns at: column0) at: (row0 := (indices at: row)).
			temp < value ifTrue: [ 
				value := temp.
				foundA0 := row0. 
				foundB0 := column0 ]].
	].	
	[ value2 = value & foundA02 = foundA0 & foundB02  = foundB0 ] assert.
	value := value2. foundA0 := foundA02. foundB0 := foundB02.