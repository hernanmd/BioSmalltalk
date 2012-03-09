*BioParsers
selectAtEvenPositions
	"Answer a new collection like the receiver which contains all elements
	of the receiver at the even positions.

	#('a' 1 2 'b' 'c' 'd') selectAtEvenPositions =  #(1 'b' 'd') . "
	
	^ self atAll: ( ( 1 to: self size ) select: #even ). 
	
	