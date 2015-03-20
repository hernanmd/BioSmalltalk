*BioTools
first: n
	"Answer the first n elements of the receiver.
	Raise an error if there are not enough elements."
	
	self reset.
	^ self next: n