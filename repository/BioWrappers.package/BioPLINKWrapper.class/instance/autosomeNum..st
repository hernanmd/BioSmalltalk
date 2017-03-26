properties - filtering
autosomeNum: aNumber  

	self propertyAt: 'autosome-num' ifAbsentPut: [ aNumber asString , 'no-y no-xy no-mt' ]