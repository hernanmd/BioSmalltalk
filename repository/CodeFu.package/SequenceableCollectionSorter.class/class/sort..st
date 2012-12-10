instance creation
sort: aCollection
	"Sort aCollection using [:a :b | a <= b]."

	^self sort: aCollection using: [:a :b | a <= b]