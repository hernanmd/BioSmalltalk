downloading
download
	" Private - Download records without splitting requests "
	
	self uids notEmpty
		ifTrue: [
			self bioLog: 'Requesting ' , self uids size asString , ' records to Entrez'.
			self results add: (self genBankFetchRecords: self uids) ]
		ifFalse: [
			self inform: 'No UIDs were found in the query' ].
	^ self results