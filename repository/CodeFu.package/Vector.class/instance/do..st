enumerating
do: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument."

	1 to: self size do: [ :index | aBlock value: (self at: index) ]