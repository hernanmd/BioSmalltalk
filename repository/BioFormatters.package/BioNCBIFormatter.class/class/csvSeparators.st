class initialization
csvSeparators
	" Answer a Collection with separator characters 
	used between columns in rows "

	^ { 'Tab' . 'Space' . '|' . ';' . ',' }