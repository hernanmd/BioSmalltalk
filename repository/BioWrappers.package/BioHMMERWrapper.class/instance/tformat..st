properties
tformat: s
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:19 pm"

	"assert target <seqdb> is in format <s>>: no autodetection"

	 ^ self propertyAt: 'tformat' ifAbsentPut: [ s ]