testing
testCreateXmlDocument
	"Note: This test uses a #match: that should pass regardless of whether
	XMLDOMParser is present in the image."

	| gv xml |
	gv := self historyOfSmalltalk.
	xml := gv asXml.
	self assert: ('*</graph>*</gxl>*' match: (xml asString last: 20))
