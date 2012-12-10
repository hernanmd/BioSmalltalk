linkage functions
averageLinkage

	| weightA weightB sizeA sizeB |
	sizeA := (clusters at: foundA0) size asDouble.
	sizeB := (clusters at: foundB0) size asDouble.
	weightA := sizeA / (sizeA + sizeB).
	weightB := sizeB / (sizeA + sizeB).

	self privateLinkage: [ :index0 :valueA :valueB | (valueA * weightA) + (valueB * weightB) ].