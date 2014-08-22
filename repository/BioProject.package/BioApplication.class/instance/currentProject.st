accessing
currentProject

	^ currentProject
		ifNil: [ " This should never be executed in production because current project must be set up by user action. For debugging purposes "
			currentProject := self createProjectNamed: 'TestProject' for: 'hernan' ]