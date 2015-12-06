properties
qformat: s
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"assert query <seqfile> is in format <s>: no autodetection"

	 ^ self propertyAt: 'qformat' ifAbsentPut: [ s ]