accessing
removeLinesWithChrGreaterThan: n
	" Sort records by chromosome position. Answer a new instance of the receiver. This is similar to evaluating the shell command :

	$ awk '($1 > 30)' Bo1.map > test1 "

	^ self shouldBeImplemented 