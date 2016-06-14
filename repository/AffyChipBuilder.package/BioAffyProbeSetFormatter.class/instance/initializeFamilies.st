initialize-release
initializeFamilies

	self setFamilies.
	self familyDictionary: Dictionary new.
	self families: (self famNames do: [ : f | self familyDictionary at: f put: nil ]).
