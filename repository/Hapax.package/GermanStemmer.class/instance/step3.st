private-algorithm
step3

	| rule2 rule1 rule3 rule4 |
	rule2 := [ (string at: cursor) ~~ $e ifTrue: [ ^self removeSuffix ] ].
	rule1 := [ 
		self removeSuffix. 
		(self endsWith: #ig in: r2) ifTrue: [ ^rule2 value ] ].
	rule3 := [ 
		self removeSuffix. 
		(self endsWith: #er in: r1) ifTrue: [ ^self removeSuffix ].
		(self endsWith: #en in: r1) ifTrue: [ ^self removeSuffix ]. ].
	rule4 := [ 
		self removeSuffix. 
		(self endsWith: #lich in: r2) ifTrue: [ ^self removeSuffix ].
		(self endsWith: #ig in: r2) ifTrue: [ ^self removeSuffix ]. ].

	(self endsWith: #isch in: r2) ifTrue: [ ^rule2 value ].
	(self endsWith: #lich in: r2) ifTrue: [ ^rule3 value ].
	(self endsWith: #heit in: r2) ifTrue: [ ^rule3 value ].
	(self endsWith: #keit in: r2) ifTrue: [ ^rule4 value ].
	(self endsWith: #end in: r2) ifTrue: [ ^rule1 value ].
	(self endsWith: #ung in: r2) ifTrue: [ ^rule1 value ].
	(self endsWith: #ig in: r2) ifTrue: [ ^rule2 value ].
	(self endsWith: #ik in: r2) ifTrue: [ ^rule2 value ].

	"rules := List new.
	rules add: 'isch' -> rule2.
	rules add: 'lich' -> rule3.
	rules add: 'heit' -> rule3.
	rules add: 'keit' -> rule4.
	rules add: 'end' -> rule1.
	rules add: 'ung' -> rule1.
	rules add: 'ig' -> rule2.
	rules add: 'ik' -> rule2.
	rules do: [ :each |
		(self endsWith: each key in: r2) ifTrue: [ ^each value value ] ]."