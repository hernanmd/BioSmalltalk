autogenerated
guidetree_in: file
	"WARNING: This is code generated automatically.
 On: 14 November 2012 - 1:22:47 am"

	"Guide tree input file (skips distance computation and guide-tree clustering step)"

	 ^ self propertyAt: 'guidetree_in' ifAbsentPut: [ self formatPlatformPath: file ]