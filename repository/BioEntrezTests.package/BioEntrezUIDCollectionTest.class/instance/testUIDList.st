testing
testUIDList

	| uids |
	
	" Test common usage "
	uids := BioEntrezUIDCollection withAll: #(34577062 24475906).
	self assert: uids baseUrl = '&id=34577062,24475906'.
	
	" Test empty "
	uids := BioEntrezUIDCollection withAll: #().
	self assert: uids baseUrl = String empty.
	
