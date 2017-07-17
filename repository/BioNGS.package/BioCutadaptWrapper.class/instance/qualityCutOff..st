properties
qualityCutOff: aNumberOrAssociation
	" Trim low-quality ends from reads BEFORE adapter removal. By default only the 3' end of each read is trimmed, use an <Association> as paramter to trim the 5' end as well "

	self propertyAt: 'q' ifAbsentPut: [ aNumberOrAssociation asBioCutadaptParameter ]
