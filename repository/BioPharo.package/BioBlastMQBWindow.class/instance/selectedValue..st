callbacks
selectedValue: aMQBValue
	" Private - Callback for property selection "

	"contentMorph getText"
	self halt.
	aMQBValue ifNil: [^self].
	self updateValue: aMQBValue.