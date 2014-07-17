testing
isEmpty
	" Answer <true> if receiver's does not contains any repository version "

	^ self repositoryVersions isNil or: [ self repositoryVersions isEmpty ]