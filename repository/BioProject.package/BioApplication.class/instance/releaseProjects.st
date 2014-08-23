initialize-release
releaseProjects
	" Release all receiver's projects. "

	self applicationProjects: nil.
	self currentProject: nil.
	self projectClass: nil