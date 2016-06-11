initialize - release
initializeSoftwareItems
	" Private - Add software items to the receiver's catalog "

	| softwareItems |
	
	softwareItems := (NeoCSVReader on: self softwareListRaw readStream)
		separator: $;;
		upToEnd.
	self assert: (softwareItems allSatisfy: [ : item | item size = 4 ]).
	^ softwareItems collect: [ : entry | self newSoftwareItem: entry ]

	