accessing public
queryAt: key put: queryString
	"Modify the receiver's URL by setting a query variable key=value.
	If key is already exists, it is overwritten."
	
	self url queryAt: key put: queryString