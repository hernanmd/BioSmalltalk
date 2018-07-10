*dhbExtensions
atAllPut: element 
	"Put element at every one of the receiver's cells."

	self rowsDo: [ : row | row atAllPut: element ]