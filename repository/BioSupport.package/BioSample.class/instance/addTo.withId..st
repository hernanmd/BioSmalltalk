accessing
addTo: aPopulation withId: instanceNumber

	| builtId |

	builtId := String streamContents: [ : stream |
		stream 
			nextPutAll: aPopulation territory;
			space;
			nextPutAll: instanceNumber asString ].
	self identifier: builtId.		
	aPopulation addSample: self.
	^ self