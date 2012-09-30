*BioTools
bioLog: aString event: aDescriptionString
	" Write aString to the streamer "
	
	self openTranscript.
	self streamer cr; 
		show: DateAndTime current;
		space;
		show: aString;
		tab;
		show: aDescriptionString