*codefu
shuffle: times
	"Swaps random elements of the receiver."

	| size random |
	size := self size.
	random := Random new.
	times timesRepeat: [ 
		self swap: (random next * size) floor + 1 with: (random next * size) floor + 1 
	].