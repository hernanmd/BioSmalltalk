testing
isCurrent
	" Answer <true> if receiver´s is set as the current one in usage for any receiver's user "

	^ self applicationUsers anySatisfy: [ : usr | usr currentProject = self ]