accesing public - protein synthesis
backTranscribe
	" Answer a new instance of the receiver's with the receiver's sequence 
	transcribed to its corresponding DNA, adjusting the alphabet "
	
	^ self class 
		newWith: self backTranscription 
		alphabet: BioIUPACUnambiguousDNA new
