accessing - private
buildPropertySeparator: assoc into: stream
	" Private - if parameter 'name' is just a single character, then use a dash as property specifier, otherwise (it is a word) use doble dash "

	assoc key size = 1
		ifTrue: [ stream nextPut: $- ]
		ifFalse: [ stream nextPutAll: '--' ]