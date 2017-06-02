accessing - filter
filter: aString
	" Set a <String> with filter status: PASS if this position has passed all filters, i.e.  a call is made at this position.  Otherwise, if the site has not passed all filters, a semicolon-separated list of codes for filters that fail.  e.g.  “q10;s50” might indicate that at this site the quality is below 10 and the number of samples with data is below 50% of the total number of samples.  ‘0’ is reserved and should not be used as a filter String.  If filters have not been applied, then this field should be set to the missing value. (String, no white-space or semi-colons permitted "

	filter := aString