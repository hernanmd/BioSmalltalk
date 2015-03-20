accessing
fileExtensionFor: aFormatString
	" Answer a String corresponding aFormatString in the receiver's registry "
	
	" Get updated "
	self initialize.
	^ (self fileExtensionsFor: aFormatString) anyOne