defaults
motifRange
	" Answer an <Interval> representing the size range allowed for the receiver, using as reference: Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "

	^ self minMotifSize to: self maxMotifSize
