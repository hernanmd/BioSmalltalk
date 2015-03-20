accessing private
userExists: username
	" Answer <true> if username exists as user for the current application users "
	
	^ self applicationUsers includesKey: username
