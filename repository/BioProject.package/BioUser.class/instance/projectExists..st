testing
projectExists: aNameString
	" Answer <true> if there is a project with aNameString in the receiver "
	
	^  self preferences searchGlobalProjects
		ifTrue: [ 
			[ ( self application applicationProjectNamed: aNameString ) isBioProject ]
			on: BioNotFoundObject
			do: [ : ex | 
				" Esto es porque un usuario puede tener su propios proyectos
				no globales a la aplicación "
				self prvProjectExists: aNameString ] ]
		ifFalse: [ self prvProjectExists: aNameString ]		
	