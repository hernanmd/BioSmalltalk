accessing projects
projectsBetween: startDate and: endDate

	^ self userProjects select: [: prj | 
		| start end |
		start := self dateClass fromString: startDate.
		end := self dateClass fromString: endDate.
		prj history creationDate between: start and: end ]