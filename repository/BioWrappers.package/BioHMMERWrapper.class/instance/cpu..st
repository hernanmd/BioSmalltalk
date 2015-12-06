properties
cpu: n
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:19 pm"

	"number of parallel CPU workers to use for multithreads"

	 ^ self propertyAt: 'cpu' ifAbsentPut: [ n ]