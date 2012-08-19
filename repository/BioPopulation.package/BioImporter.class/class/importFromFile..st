initialize-release
importFromFile: rawDataFilePath
	" 
	Read breed data from raw file, parse and build the receiver's repository 
	"
	| parser |
	
	parser := STextParser on: ( self openFileNamed: rawDataFilePath  ).
	parser 
		delimiter: $;;
		converter: self parserConverter;
		rowsDo: [:row | self addNewSpeciesFromCsv: row ].