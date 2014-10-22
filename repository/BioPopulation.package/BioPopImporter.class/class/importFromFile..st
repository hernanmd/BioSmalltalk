initialize-release
importFromFile: rawDataFilePath
	" 
	Read breed data from raw file, parse and build the receiver's repository 
	"
	| parser |
	
	parser := NeoCSVReader on: (self openFileNamed: rawDataFilePath) readStream.
	parser 
		separator: $;;
		converter: self parserConverter;
		do: [ : row | self addPopulationFromCsvRow: row ].