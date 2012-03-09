accessing
saveTag: tagName value: tagValueString
	" Private - Save the matched tagNameString with its tagValueString in the receiver's result "

	self formatter 
			saveTag: tagName
			value: tagValueString 
			in: self results