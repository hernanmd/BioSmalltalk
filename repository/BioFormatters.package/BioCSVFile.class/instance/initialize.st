initialize-release
initialize
	" Private - Initialize the receiver's default parameters "

	super initialize.
	self ignoreLinesCount: 0.
	self ignoreLinesStrategy: self defaultIgnoreLinesStrategy.
