private
collectLogPValues

	self logpCol: (self inputFile asFileReference readStreamDo: [ : stream |
		(NeoCSVReader on: stream)
			separator: Character space;
			skipHeader;
			select: [ : record | record fourth notNil and: [ record fourth ~= 'NA' and: [ record fourth asFloat >= self ylim ] ] ] ]).