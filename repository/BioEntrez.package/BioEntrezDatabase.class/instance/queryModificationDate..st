accessing public
queryModificationDate: aDate
	" Answer a <String> with the date of most recent modification of a sequence record. The date format is YYYY/MM/DD. Only the year is required. The Modification Date is often used as a range of dates. The colon ( : ) separates the beginning and end of a date range "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aDate asEntrezDateString; 
			space;
			nextPutAll: self qualifierForModificationDate ]