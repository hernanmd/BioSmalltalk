accessing
searchGlobalProjects

	^ searchGlobalProjects
		ifNil: [ searchGlobalProjects := self defaultSearchGlobalProjects ]