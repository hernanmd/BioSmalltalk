*hapax
changeSizeTo: newSize
	"The receiver changes size."
	
	"This is not a copy of the receiver, so all shared references survive."

	| newArray |
	newArray := self copyEmpty: newSize.
	newArray
		replaceFrom: 1
		to: (self size min: newSize)
		with: self.
	self become: newArray