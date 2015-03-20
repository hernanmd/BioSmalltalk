accessing private
addOption: optionName value: optionValue
	" Private - Add optionName and optionValue to the receiver's options stack "

	self options addLast:  '-' , optionName , ' ' , optionValue.