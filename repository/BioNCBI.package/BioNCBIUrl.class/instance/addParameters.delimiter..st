accessing
addParameters: aQueryString delimiter: aDelimiterStirng
	" Append aString as the receiver's database name "

	| queryFragment |
	queryFragment := self path last , aDelimiterStirng , aQueryString.
	self path removeLast.
	self path addLast: queryFragment