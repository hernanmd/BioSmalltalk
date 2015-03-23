testing
isGenBankXMLDirectory: aString 
	" Answer <true> if all files contained in aString are XML files with GenBank DTD "
	
	^ aString asFileReference entries allSatisfy: #isGenBankXML