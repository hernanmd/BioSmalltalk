initialize-release
initialize
	" Private - Initialize receiver's versioning information "
	
	super initialize.
	versions := OrderedCollection new.
	versioner := self versionerClass new.
	date := self dateClass now.	