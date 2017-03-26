private
validOrganisms
	" Answer a <Collection> of <String> with valid organisms names for the receiver "

	| ro |
	
	ro := self class superclass organization.
	^ ro listAtCategoryNamed: 'options - organisms'