private
newIdFor: groupDictionary

	self halt.
	groupDictionary associationsDo: [ : groupedDictionary | 
		groupBuilder groupSamples
			at: groupedDictionary key
			ifPresent: [ : elem | prvIdentifiers := prvIdentifiers + 1 ]
			ifAbsent: [ prvIdentifiers := 1 ] ].
	^ 'h' , prvIdentifiers greaseString
