testing
test1OwnerAdding

	| ownerName1 ownerName2 user1 |
	
	ownerName1 := 'owner1'.
	ownerName2 := 'owner2'.
	user1 := 'user1'.
	BioApplication release.

	" Create a normal user and add a new project "
	project := ( BioUser named: user1 ) addProject: self samplePrjName.
	" Create another user acting as an owner "
	BioUser named: ownerName1.
	" Add as an owner to the normal user project "
	project addOwner: ownerName1.
	
	self assert: project hasOwner.
	self assert: ( project isOwner: ownerName1 ).
	self deny: ( project isOwner: ownerName2 ).
	self assert: project owners size = 1.

	BioUser named: ownerName2.
	project addOwner: ownerName2.
	self assert: project owners size = 2.
	self assert: ( project isOwner: ownerName2 ).	

	self should: [ project addOwner: ownerName1 ] raise: BioDuplicatedObject.
