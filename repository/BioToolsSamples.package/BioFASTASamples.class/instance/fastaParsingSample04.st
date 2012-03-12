samples-code
fastaParsingSample04
	" BioFASTASamples new fastaParsingSample04. "
	
	| fastaParser |
	
	fastaParser := BioFASTABasicParser on: self fastaResult01.
	^ fastaParser sequenceInfo 

