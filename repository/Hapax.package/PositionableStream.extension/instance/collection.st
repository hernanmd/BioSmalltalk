*hapax
collection
	"Answer the collection over which we're streaming. This is
	in general a Very Bad Thing, but is much more efficient than
	#contents if the client is not always going to retain the string
	for later use, and if the client acknowledges the many risks
	involved with breaking encapsulation this way."

	^collection