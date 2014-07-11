downloading
splitDownload

	| index splittedRs |

	splittedRs := OrderedCollection new: self entrezUrlUidLimit.	
	index := 1.
	self uids do: [: id  |
			splittedRs add: id.
			index \\ self entrezUrlUidLimit = 0
				ifTrue: [
					self bioLog: 'Requesting ' , splittedRs size asString , ' records to Entrez'.
					self results add: (self genBankFetchRecords: splittedRs).
					splittedRs := OrderedCollection new: self entrezUrlUidLimit ].
			index := index + 1 ]
		displayingProgress: 'Downloading...' translated.
	^ self results