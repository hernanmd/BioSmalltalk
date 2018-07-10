accessing
clumpFindK: k length: l times: t 
	" Given integers L and t, a string Pattern forms an (L, t)-clump inside a (larger) string Genome if there is an interval of Genome of length L in which Pattern appears at least t times. This method search for the k-mer pattern in the receiver, appearing at least t times in a l window size. Answer a <Collection> "
	
	| lookup sequences |
	lookup := Dictionary new.
	sequences := Set new.
	1 to: self size - k do: [ : index |
		| seg |
		seg := self sequence copyFrom: index to: index + k - 1.
		[ (lookup at: seg ifAbsentPut: [ OrderedCollection new ]) notEmpty and: [ (index + k - (lookup at: seg) first) > l ] ]
			whileTrue: [ (lookup at: seg) removeFirst ].
		lookup at: seg ifPresent: [ : c | c add: index ] ifAbsentPut: [ OrderedCollection with: index ].
		(lookup at: seg) size = t
			ifTrue: [ sequences add: seg ] ].
	^ sequences