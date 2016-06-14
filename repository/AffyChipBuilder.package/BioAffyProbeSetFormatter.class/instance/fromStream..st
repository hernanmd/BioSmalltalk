report
fromStream: stream 

	(NeoCSVReader on: stream)
		separator: Character tab;
		skipHeader;
		do: [ : record | self fromRecord: record ].
	self csvWriter flush
