printing
storeDenseTextOn: aStream

	aStream print: self size; cr.
	self do: [ :each | aStream print: each ] separatedBy: [ aStream space. ].
	aStream cr.