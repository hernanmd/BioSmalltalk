instance creation
new
	" #initialize is not called implicitely when sending #new to an object in other Smalltalk dialects. "
	
	^ self basicNew initialize