accessing
fileExtensionFor: aFormatString
	" Answer a String corresponding aFormatString in the receiver's registry "
	
	^ (self fileExtensionsFor: aFormatString) anyOne