*BioTools
bioLog: aString
	" Write aString to the Transcript "
	
	| trWindow |
	trWindow := self openTranscript.
	self streamer cr; 
		show: DateAndTime current;
		space;
		show: aString.
	^ trWindow