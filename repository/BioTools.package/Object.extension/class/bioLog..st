*BioTools
bioLog: aString
	" Write aString to the Transcript "
	
	self openTranscript.
	self streamer cr; 
		show: TimeStamp current;
		space;
		show: aString.