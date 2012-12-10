linkage functions
wardsMethod

	| sizeA sizeB valueC sizeC weightA weightB weightC |
	sizeA := (clusters at: foundA0) size asDouble.
	sizeB := (clusters at: foundB0) size asDouble.
	valueC := (self at: foundA0 and: foundB0).

	self privateLinkage: [ :index0 :valueA :valueB |
		sizeC := (clusters at: index0) size.
		weightA := (sizeA + sizeC) / (sizeA + sizeB + sizeC).
		weightB := (sizeB + sizeC) / (sizeA + sizeB + sizeC).
		weightC := sizeC / (sizeA + sizeB + sizeC).
		(valueA * weightA) + (valueB * weightB) - (valueC * weightC) 
	].