*BioPharo4
requestOpenCSVFile: actionBlock
	" Open request dialog to select a CSV file and perform actionBlock if selected path is valid "
	
	^ self requestOpenCSVFile ifNotNilDo: actionBlock