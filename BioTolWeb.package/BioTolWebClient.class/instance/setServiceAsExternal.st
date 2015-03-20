accessing private
setServiceAsExternal
	" Set ther receiver's service type as external "

	self url queryAt: 'service' put: 'external'