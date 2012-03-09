accessing
includesRecordInformation: aString
	" Answer <true> if aString includes territorial information abour the current node "

	^ current ~= 'GBQualifier_name' and: [ current ~= 'GBQualifier_value' ]
	