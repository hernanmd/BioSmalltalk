accessing
consensus

	^ consensus
		ifNil: [ consensus := String empty ]