exporting
exportStatementFormat.
	" A format statement contains one or more command statements. A command statement contains a command and a valid setting keyword (command=keyword format). For example, the command statement DataType=Nucleotide tells MEGA that nucleotide sequence data is contained in the file. Based on the DataType setting, different types of keywords are valid. "
	
	self stream nextPutAll: '!!Format '.
	self 
		exportDataType;
		exportIndel;
		exportCodeTable.
	self stream nextPut: $; 