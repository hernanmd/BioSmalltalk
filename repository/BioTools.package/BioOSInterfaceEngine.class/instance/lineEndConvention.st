accessing
lineEndConvention
	" Answer a <Symbol> #cr, #lf or #crlf with the current's system line end convention "

	self isRunningInUnix
		ifTrue: [ ^ #cr ].
	self isRunningInWindows
		ifTrue: [ ^ #crlf ].
	self isRunningInMac
		ifTrue: [ ^ #cr ].