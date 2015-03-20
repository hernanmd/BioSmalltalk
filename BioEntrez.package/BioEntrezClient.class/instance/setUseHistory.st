accessing public
setUseHistory
	" Store the retrieved sets of UIDs temporarily in the Entrez history server
	so that they can be subsequently combined or provided as input for
	other calls. Set the receiver's to use the remove web environment and
	query key "
	
	^ self url setUseHistory