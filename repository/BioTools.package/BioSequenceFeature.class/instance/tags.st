accessing - tags
tags
	" Answer a <Collection> with the receiver's tags "

	^ tags
		ifNil: [ tags := self tagCollectionClass new ]