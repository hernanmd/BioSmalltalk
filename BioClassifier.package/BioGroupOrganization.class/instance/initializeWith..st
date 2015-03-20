initialize-release
initializeWith: aCollection
	" Private - Set the receiver's groups using aCollection "
	
	contents := aCollection collect: [: elem | self elementGroupClass new name: elem ]