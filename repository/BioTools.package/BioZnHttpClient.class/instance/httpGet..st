accessing
httpGet: urlString
	"Get the response from the given url"
	" ( self httpGet: 'http://www.squeak.org') content "
	
	self needsWork.
	" Zn is answering a ByteArray ? "
	^ ( super httpGet: urlString ) collection