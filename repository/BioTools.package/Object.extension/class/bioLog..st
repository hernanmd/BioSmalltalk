*BioTools
bioLog: aString
	" Write aString to the Transcript "
	
	self openTranscript.
	self streamer cr; 
		show: DateAndTime current;
		space;
		show: aString.