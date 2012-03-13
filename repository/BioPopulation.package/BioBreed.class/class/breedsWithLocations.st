accessing
breedsWithLocations

	^ self breeds reject: [: b | b locations isNil or:[ b locations isEmpty ]]