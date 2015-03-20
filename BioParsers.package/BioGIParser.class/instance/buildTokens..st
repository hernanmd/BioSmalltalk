accessing
buildTokens: aCollection
	" Answer a Collection object for the receiver's parsing output "

	self results: aCollection second.
	^ self results		