accessing
results
	" Answer an object suitable for storing receiver's parsing results "

	^ results
		ifNil: [ results := self resultClass new ]