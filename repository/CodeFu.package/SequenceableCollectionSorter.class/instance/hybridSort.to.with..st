private
hybridSort: i to: j with: scratch
	"Sort elements i through j of self to be non-descending according to sortBlock.
	 Use quicksort for large ranges and insertion sort for ranges within scratch size."
	"The prefix d means the data at that index."
	| di dij dj tt ij k l n |
	"Nothing to sort."
	(n := j + 1 - i) <= 1 ifTrue: [^self].
	n <= scratch size ifTrue:
		["Few elements; use an insertion sort."
		scratch at: 1 put: (self collectionAt: i).
		2 to: n do:
			[:x|
			di := self collectionAt: i + x - 1.
			k := 1.
			 [k < x and: [sortBlock value: (scratch at: k) value: di]]
				whileTrue:
					[k := k + 1].
			 k < x ifTrue:
				[scratch replaceFrom: k + 1 to: x with: scratch startingAt: k].
			scratch at: k put: di].
		1 to: n do:
			[:x| self collectionAt: i + x - 1 put: (scratch at: x)].
		^self].
	
	"Assume more than three elements."
	"Sort di,dj and dij."
	di := self collectionAt: i.
	dj := self collectionAt: j.
	(sortBlock value: di value: dj) ifFalse: 
		[self swap: i with: j.
		 tt := di.
		 di := dj.
		 dj := tt].	"i.e., should di precede dj?"
	ij := (i + j) // 2.	"ij is the midpoint of i and j."
	dij := self collectionAt: ij.	"Sort di,dij,dj.  Make dij be their median."
	(sortBlock value: di value: dij) "i.e. should di precede dij?"
		ifTrue: 
			[(sortBlock value: dij value: dj) ifFalse: "i.e., should dij precede dj?"
				[self swap: j with: ij.
				dij := dj]]
		ifFalse: "i.e. di should come after dij"
			[self swap: i with: ij.
			dij := di].
	"Find k>i and l<j such that dk,dij,dl are in reverse order.
	 Swap k and l.  Repeat this procedure until k and l pass each other."
	k := i.
	l := j.
	[	[l := l - 1.
		k <= l and: [sortBlock value: dij value: (self collectionAt: l)]] 
			whileTrue.	"i.e. while dl succeeds dij"
		[k := k + 1.
		k <= l and: [sortBlock value: (self collectionAt: k) value: dij]] 
			whileTrue.	"i.e. while dij succeeds dk"
	k <= l] 
			whileTrue:
				[self swap: k with: l].
	"Skip already sorted ranges."
	[k < j and: [sortBlock value: (self collectionAt: k) value: dij]]
		whileTrue:
			[k := k + 1].
	"Now l<k (either 1 or 2 less), and di through dl are all less than or equal to dk
	 through dj.  Sort those two segments."
	self hybridSort: i to: l with: scratch.
	self hybridSort: k to: j with: scratch