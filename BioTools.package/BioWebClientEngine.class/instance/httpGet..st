accessing
httpGet: urlString
	"Get the response from the given url"
	" ( self httpGet: 'http://www.squeak.org') content "
	
	^ (self classFor: self providerClass) httpGet: urlString