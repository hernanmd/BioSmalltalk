initialize-release
initializeRows: m columns: n

	m = n ifFalse: [ Array new noMatchError ].
	partialColumns := Array new: m.
	^self.