releasing
deleteAll

	self nodes values do: [:each | each delete].
	self edges do: [:each | each delete].