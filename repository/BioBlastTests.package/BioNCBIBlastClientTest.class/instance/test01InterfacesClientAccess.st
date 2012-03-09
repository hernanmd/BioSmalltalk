testing
test01InterfacesClientAccess

	| blastInterface |
	
	blastInterface := BioBlast.
	self assert: blastInterface wrappers isCollection.
	
	self assert: blastInterface ncbi = BioNCBIBlast.
	self assert: blastInterface ncbi local = BioNCBILocalBlastClient.
	self assert: blastInterface wu remote = nil.
	self assert: blastInterface ncbi remote = BioNCBIWWWBlastClient.


	
