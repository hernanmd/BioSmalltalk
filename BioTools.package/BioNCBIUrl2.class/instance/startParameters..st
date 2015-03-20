accessing
startParameters: aQueryString
	" Add aQueryString as the start parameter in the receiver's parameters "

	"self addParameters: aQueryString delimiter: '?'."
	| keyAndValue |
	keyAndValue := aQueryString findTokens: '='.
	^ self ? (keyAndValue first -> keyAndValue last).
