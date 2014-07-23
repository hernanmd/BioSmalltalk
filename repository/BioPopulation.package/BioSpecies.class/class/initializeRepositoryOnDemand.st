initialize-release
initializeRepositoryOnDemand

	^ initializeRepositoryOnDemand
		ifNil: [ initializeRepositoryOnDemand := true ]