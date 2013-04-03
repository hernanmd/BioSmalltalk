initialize-release
initialize
	" Private - Initialize receiver's versioning information "
	
	super initialize.
	versions := OrderedCollection new.
	date := self dateClass now.	