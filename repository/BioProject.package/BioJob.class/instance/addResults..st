accessing
addResults: anObject
	" Add anObject to the receiver's results. Answer the newly created search result "
	
	^ (self createResultFrom: anObject) addToProject: self
