accessing
currentProject

	^ currentProject
		ifNil: [ " This should never be executed in production because current project must be set up by user action. For debugging purposes "
			self projectClass: (Smalltalk at: #PCTProject).
			currentProject := self createProjectNamed: 'TestProject' for: (BioUser named: 'hernan')]