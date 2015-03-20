samples-code
fastaParsingSample03
	" BioFASTASamples new fastaParsingSample03. "
	| fastaParser |
	
	fastaParser := BioFASTABasicParser on: self fastaResult02.
	^ fastaParser sequenceInfo 
	
	" Should answer  '>gi|115304323|gb|AF288373.2| Bos taurus peroxisome proliferator activated receptor gamma 2 gene, promoter region and partial cds' "
