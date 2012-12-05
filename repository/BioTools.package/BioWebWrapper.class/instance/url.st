accessing private
url
	"Answer the value of url"

	^ self rawUrl
		ifNil: [ url := self urlClass absoluteFromText: self baseUrl ]