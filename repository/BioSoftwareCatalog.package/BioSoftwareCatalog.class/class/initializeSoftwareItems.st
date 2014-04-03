accessing
initializeSoftwareItems
	" Private - Add software items to the receiver's catalog "

	| items |
	
	items := (NeoCSVReader on: self softwareListRaw readStream)
		separator: $;;
		upToEnd.
	self assert: (items allSatisfy: [ : item | item size = 4 ]).
	^ items collect: [ : entry | self newSoftwareItem: entry ]

	