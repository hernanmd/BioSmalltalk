accessing
decode: aString
	" Answer a String. Decodes the fields embedded in aString url ?var1=val1&var2=val2 "
	
	^ BioWebClientEngine adapterClass decode: aString