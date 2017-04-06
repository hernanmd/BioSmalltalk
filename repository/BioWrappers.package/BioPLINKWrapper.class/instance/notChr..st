properties - filtering
notChr: aCollectionOrInterval
	" Is the reverse of #chr: variants on listed chromosome(s) are excluded "

	self propertyAt: 'not-chr' ifAbsentPut: [ aCollectionOrInterval asPLINKParameter ]