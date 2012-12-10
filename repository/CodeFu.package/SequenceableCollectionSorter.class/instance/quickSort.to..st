private
quickSort: i to: j 
	"Sort elements i through j of self to be nondescending according to sortBlock."

	"The prefix d means the data at that index."
	| di dij dj tt ij k l n |
	(n := j + 1 - i) <= 1 ifTrue: [^self].	"Nothing to sort."
	"Sort di,dj."
	di := self collectionAt: i.
	dj := self collectionAt: j.
	(sortBlock value: di value: dj)  "i.e., should di precede dj?"
		ifFalse: 
			[self swap: i with: j.
			tt := di.
			di := dj.
			dj := tt].
	n > 2
		ifTrue: 
			["More than two elements."
			ij := i + j // 2.	"ij is the midpoint of i and j."
			dij := self collectionAt: ij.
			(sortBlock value: di value: dij)
				ifTrue: ["Sort di,dij,dj. Make dij be their median."
					"i.e. should di precede dij?"
					(sortBlock value: dij value: dj)
						ifFalse: 
							["i.e., should dij precede dj?"
							self swap: j with: ij.
							dij := dj]]
				ifFalse: 
					["i.e. di should come after dij"
					self swap: i with: ij.
					dij := di].
			n > 3
				ifTrue: 
					["More than three elements."
					"Find k>i and l<j such that dk,dij,dl are in reverse order. 
					Swap k and l. Repeat this procedure until k and l pass each other."
					k := i.
					l := j.
					[[l := l - 1.
					k <= l and: [sortBlock value: dij value: (self collectionAt: l)]] whileTrue.  "i.e. while dl succeeds dij"
					[k := k + 1.
					k <= l and: [sortBlock value: (self collectionAt: k)
							value: dij]] whileTrue.	"i.e. while dij succeeds dk"
					k <= l]
						whileTrue: [self swap: k with: l].	"Now l<k (either 1 or 2 less), and di through dl are all less than or equal to dk 
					through dj. Sort those two segments."
					self quickSort: i to: l.
					self quickSort: k to: j]]