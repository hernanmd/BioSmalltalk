accesing public - protein synthesis
transcribe
	" Answer a new instance of the receiver's with the receiver's sequence transcribed to its corresponding mRNA, adjusting the alphabet "
	
	^ self class 
		newWith: self transcription 
		alphabet: BioIUPACUnambiguousRNA
