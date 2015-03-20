accessing
addParameters: aQueryString
	" Append aQueryString in the receiver's parameters "

	self addParameters: aQueryString delimiter: '&'
