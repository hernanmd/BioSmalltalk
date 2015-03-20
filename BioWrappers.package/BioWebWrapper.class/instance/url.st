accessing private
url
	"Answer the value of url"

	^ self rawUrl
		ifNil: [ url := BioWebClientEngine urlFromString: self baseUrl ]