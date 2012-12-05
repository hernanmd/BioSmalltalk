testing
test01InterfacesClientAccess

	| blastInterface |
	
	blastInterface := BioBlastWrapper.
	self assert: blastInterface wrappers isCollection.
	
	self assert: blastInterface ncbi = BioNCBIBlastWrapper.
	self assert: blastInterface ncbi local = BioNCBILocalBlastWrapper.
	self assert: blastInterface wu remote = nil.
	self assert: blastInterface ncbi remote = BioNCBIWWWBlastWrapper.


	
