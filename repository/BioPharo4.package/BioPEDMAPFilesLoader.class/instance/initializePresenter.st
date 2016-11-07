initialization
initializePresenter
	" Private - See superimplementor's comment "
	
	super initializePresenter.
	self toolbar firstButtonAction: [ ].
	self toolbar secondButtonAction: [ self addPEDMAPFiles ].
	self toolbar thirdButtonAction: [ self delete ].