instance creation
on: aCollection
	"Answer a Sorter on aCollection using [:a :b | a <= b]."

	^self on: aCollection using: [:a :b | a <= b]