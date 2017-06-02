accessing
quality: aNumber
	" Set a <Number> of Phred-scaled quality score for the assertion made in ALT. i.e. − 10 log10 prob(call in ALT is wrong).  If ALT is ‘.’  (no variant) then this is - 10 log10 prob(variant), and if ALT is not ‘.’  this is − 10 log10 prob(no variant).  If unknown, the missing value should be specified."

	quality := aNumber