accessing
addTo: aPopulation withId: instanceNumber

	self identifier: ( aPopulation territory , 
						String space , 
						instanceNumber asString ).
	aPopulation addSample: self.
	^ self