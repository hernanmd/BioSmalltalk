testing
test02LegacyLocalClientAccess

	| blastInterface |
	
	blastInterface := BioBlastWrapper.
	
	self assert: blastInterface ncbi local legacy class = BioNCBILocalBlastLegacy2223.	
	self assert: blastInterface ncbi local legacy blastAllPath isString.
	self assert: blastInterface ncbi local legacy bl2seqPath isString.
	self assert: blastInterface ncbi local legacy blastClustPath isString.
	self assert: blastInterface ncbi local legacy blastPgpPath isString.
	self assert: blastInterface ncbi local legacy copymatPath isString.
	self assert: blastInterface ncbi local legacy fastaCmdPath isString.
	self assert: blastInterface ncbi local legacy formatDbPath isString.
	self assert: blastInterface ncbi local legacy formatRpsDbPath isString.
	self assert: blastInterface ncbi local legacy impalaPath isString.
	self assert: blastInterface ncbi local legacy makeMatPath isString.
	self assert: blastInterface ncbi local legacy megaBlastPath isString.
	self assert: blastInterface ncbi local legacy rpsBlastPath isString.
	self assert: blastInterface ncbi local legacy seedTopPath isString.
