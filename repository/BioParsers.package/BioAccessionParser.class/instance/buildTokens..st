accessing
buildTokens: aCollection
	" Answer a Collection object for the receiver's parsing output "

	aCollection first
		ifNil: [ self results: aCollection second ]
		ifNotNil: [ self results: aCollection ].
	^ self results		