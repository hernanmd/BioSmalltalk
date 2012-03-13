accessing
setNameFormatStandard
	" Use a standard null formatter "
	
	self formatters remove: self nameFormatter.
	self formatters add: BioStandardNaming new.