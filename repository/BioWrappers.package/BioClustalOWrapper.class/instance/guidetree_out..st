autogenerated
guidetree_out: file
	"WARNING: This is code generated automatically.
 On: 14 November 2012 - 1:22:47 am"

	"Guide tree output file"

	 ^ self propertyAt: 'guidetree_out' ifAbsentPut: [ self formatPlatformPath: file ]