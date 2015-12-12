private
execSelector
	" Private - Answer a <Symbol> which specifies the appropriate selector to execute a command in the receiver's host system "

	self isRunningInWindows
		ifTrue: [ ^ self execSelectorForWindows ].
	self isRunningInUnix
		ifTrue: [ ^ self execSelectorForUnix ].
	self isRunningInMac
		ifTrue: [ ^ self execSelectorForMac ].
	^ self signalNotFound: 'Platform undetected'