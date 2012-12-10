*codefu
copyRemoveAtIndex: index
	"Return a copt of the receiver without the element at index."

	| newSequenceableCollection |
	newSequenceableCollection := self species withSize: self size - 1.
	newSequenceableCollection
		replaceFrom: 1
		to: index - 1
		with: self
		startingAt: 1.
	newSequenceableCollection
		replaceFrom: index
		to: self size - 1
		with: self
		startingAt: index +1.
	^newSequenceableCollection