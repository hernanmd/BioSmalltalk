accessing private
outputToStream: aString

	self openTranscript.
	self streamer cr; 
		show: TimeStamp current;
		cr;
		show: aString;
		cr