private-algorithm
endsWith: aSuffix in: aMark

	^(self endsWith: aSuffix) and: [ cursor >= aMark ]