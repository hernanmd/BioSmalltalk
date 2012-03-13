generating
make: outputFormat

	"makes the requested output format on disk and returns full filename to output file 
	e.g. write a SVG output file and returns full path to the output file"

	| fileName fs |
	fileName := self outputFileNameFor: outputFormat.
	fs := FileStream newFileNamed: fileName.
	[fs nextPutAll: (self generateType: outputFormat)] ensure: [fs close].
	^ fileName
