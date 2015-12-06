properties
textw: n
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"set max width of ASCII text output lines  [120]  (n>=120)"

	 ^ self propertyAt: 'textw' ifAbsentPut: [ n ]