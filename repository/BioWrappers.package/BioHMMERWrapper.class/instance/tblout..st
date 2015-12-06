properties
tblout: f
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"save parseable table of per-sequence hits to file <s>"

	 ^ self propertyAt: 'tblout' ifAbsentPut: [ f ]