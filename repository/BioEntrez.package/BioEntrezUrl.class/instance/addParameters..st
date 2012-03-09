accessing
addParameters: aQueryString
	" Append aQueryString as the receiver's database name "

	self buildUrl: self path last with: aQueryString.
