accessing private - protein synthesis
backTranscription 
	" Answer a String with the back transcription of the receiver's sequence "
	
	^ seq asUppercase copyReplaceAll: 'U' with: 'T'