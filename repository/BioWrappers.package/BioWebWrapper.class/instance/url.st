accessing private
url
	"Answer the value of url"

"	^ self rawUrl
		ifNil: [ url := self baseUrl asUrl ]"
	^ self rawUrl
		ifNil: [ url := self urlClass fromString: self baseUrl ]