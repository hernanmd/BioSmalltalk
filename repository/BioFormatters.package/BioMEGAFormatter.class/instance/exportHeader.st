exporting
exportHeader
	" Private - The first line must contain the keyword #MEGA to indicate that the data file is in MEGA format."
	
	self stream 
		nextPutAll: '#mega';
		crlf