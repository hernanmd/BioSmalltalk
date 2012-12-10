*hapax
equalsTo: aCollection 
	"Answer true if the reciever contains the same elements as aCollection, and vice versa."

	^(aCollection isCollection) 
		and: [ aCollection size = self size 
			and: [ aCollection allSatisfy: [ :each | 
				(aCollection occurrencesOf: each) = (self occurrencesOf: each) ]]]