accessing
lineEndConvention
	" Answer #cr, #lf or #crlf with the current's system line end convention " 
	
	^ self adapterClass new lineEndConvention