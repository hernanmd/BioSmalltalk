*BioTools
gtLog: aString event: aDescriptionString
	" Write aString to the streamer "
	
	self openTranscript.
	self streamer cr; 
		show: TimeStamp current;
		space;
		show: aString;
		tab;
		show: aDescriptionString