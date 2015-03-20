accessing
buildClassNames: row
	" Private - Build receiver's wrapper class names from row "
	
	| newClsName newClsTestName |
	
	newClsName := self newClassPrefix , row first , self newClassPostfix.
	newClsTestName := self newClassPrefix , row first , self newClassTestPostfix.
	self generateClass: newClsName.
	self generateTestClass: newClsTestName.
	self targetClass: (self classFor: newClsName).