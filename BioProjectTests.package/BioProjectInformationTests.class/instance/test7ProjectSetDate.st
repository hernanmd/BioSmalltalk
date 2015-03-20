testing
test7ProjectSetDate

	| oldDate dateObject |

	BioApplication release.
	user := BioUser named: 'user1'.

	oldDate := '1-10-2000 11:55:00 am'.
	dateObject := self dateClass fromString: oldDate .
	
	user addProject: self samplePrjName.
	project := user projectINamed: self samplePrjName.
	project history creationDate: dateObject.
	
	self assert: ( project history creationDate isKindOf: self dateClass ).
	self assert: ( project history creationDate = dateObject ).
