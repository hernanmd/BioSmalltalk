accessing private
getUrl
	" Answer the value of url for the get command "
	
	^ getUrl
		ifNil: [ getUrl := self urlClass fromString: self baseUrl ]	