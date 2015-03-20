accessing
identifyFrom: aPopulation

	| instanceNumber |

	( instanceNumber := aPopulation occurrencesOf: self sequence ) > 0
		ifTrue: [
			| smp |
			smp := aPopulation samples 
				detect: [ : samp | samp sequence = self sequence ]
				ifNone: [ 
					self addTo: aPopulation withId: aPopulation samples size ].
			smp frequency: smp frequency + 1 ]
		ifFalse: [ 
			frequency := 1.
			self addTo: aPopulation withId: instanceNumber			
		].
		
