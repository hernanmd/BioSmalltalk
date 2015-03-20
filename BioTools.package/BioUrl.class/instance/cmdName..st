deprecate
cmdName: aCmdString
	" Append aString as the receiver's command name "

	self addPathSegment: aCmdString
	"self buildUrl: aCmdString with: self path last.	"
