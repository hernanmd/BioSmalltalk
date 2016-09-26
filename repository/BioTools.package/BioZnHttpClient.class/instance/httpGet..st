accessing
httpGet: urlString
	"Get the response from the given url"
	" (self httpGet: 'http://www.squeak.org') content "
	
	UIManager default informUserDuring: [ : bar |
		bar label: 'Downloading...'.
		^ [ (self classFor: self providerClass) new get: urlString ]
		on: HTTPProgress, ZnEntityTooLarge, ConnectionClosed 
		do: [ : ex | self handleWebClientException: ex progressBar: bar ] ]
