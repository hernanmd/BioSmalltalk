private
collectLogPValues
	" For each SNP in the input file, build a <Collection> with valid (not null) -log10(p-value) which are greater than configured ylim value "

	self logpCol: (self inputFile asFileReference readStreamDo: [ : aStream |
		(NeoCSVReader on: aStream)
			separator: Character space;
			skipHeader;
			select: [ : record | record fourth notNil and: [ record fourth ~= 'NA' and: [ record fourth asFloat >= self ylim ] ] ] ]).