*BioParsers
selectAtOddPositions
	"Answer a new collection like the receiver which contains all elements
	of the receiver at the odd positions.

	#('a' 1 2 'b' 'c' 'd') selectAtOddPositions =  #('a' 2 'c') . "
	
	^ self atAll: ( ( 1 to: self size ) select: #odd ). 
	
	