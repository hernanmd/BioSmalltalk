user interface
setDescription: aText 
	" #setDescription is implemented because #sequenceEditorIn: is implemented "

	self status reset.
	self addToStatus: aText.
	self changed: #getDescription