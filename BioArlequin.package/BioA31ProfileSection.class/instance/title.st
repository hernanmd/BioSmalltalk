getting configurations
title
	" Answer a String for the Title configuration "
	
	^ self at: self class titleId ifAbsent: [ '""' ]