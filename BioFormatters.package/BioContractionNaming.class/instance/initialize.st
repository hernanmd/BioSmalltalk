initialize-release
initialize
	" Private - Set receiver's default settings "
	
	super initialize.
	capitalize := true.
	skipStopWords := false.
	contractionLimit := 3.
