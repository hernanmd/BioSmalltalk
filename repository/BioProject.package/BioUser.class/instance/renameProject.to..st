accessing projects
renameProject: oldName to: newName
	" Rename the project named oldName with newName if exists
	in the receiver. Answer the project information object "

	^ ( self projectINamed: oldName ) name: newName


	