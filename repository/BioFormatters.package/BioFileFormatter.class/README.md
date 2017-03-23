BioFileFormatter reads from an input file, performs formatting and write the results to an output file.

Instance Variables:
	cwd 			<String>					Current working directory.
	inputFile		<String | FileReference> 	File name of the input file.
	outputFile		<ProtoObject>
	outputFilename	<String>
	stream			<WriteStream>
	inputStream		<ReadStream>
	writeToFile		<Boolean>			If <true> then write the output to a file