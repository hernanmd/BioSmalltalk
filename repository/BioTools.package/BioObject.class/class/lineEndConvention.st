filesystem
lineEndConvention
	" Answer #cr, #lf or #crlf "

	self isRunningInUnix
		ifTrue: [ ^ # cr ].
	self isRunningInWindows
		ifTrue: [ ^ #crlf ].
	self isRunningInMac
		ifTrue: [ ^ # cr ].