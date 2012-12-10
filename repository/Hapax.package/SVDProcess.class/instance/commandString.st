accessing
commandString
	"self commandString "

	| stream |
	stream := String new writeStream.
	stream 
	"SVD command"
		nextPut: $"; 
		nextPutAll: self programFilename asString;
		nextPut: $";
		space;
	"read sparse binary, write dense binary"
		nextPutAll: '-r sb -w db'; 
		space;
	"desired SVD dimensions (ie rank)"
		nextPutAll: '-d'; 
		space;
		print: dimensions;
		space;
	"base of files in which to store resulting U,S,V"
		nextPutAll: '-o';
		space;
		nextPut: $";
		nextPutAll: self outputFilename asString;
		nextPut: $";
		space;
	"input matrix file"
		nextPut: $";
		nextPutAll: self inputFilename asString;
		nextPut: $".
	^stream contents