accessing
do: aClosure
	" Evaluate aBlock with each of the receiver's elements as the argument. "
	
	self sequence do: aClosure	
