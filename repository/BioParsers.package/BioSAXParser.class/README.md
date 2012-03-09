BioSAXParser is the root superclass for all SAX parsers in BioSmalltalk.

The catchNodes instance variable is a workaround to a StAX-like parsing feature because at the time of this writing there was no solid StAX support in Smalltalk. Indeed, a StAX parser allows to select or filter specific nodes in a XML, while SAX is commonly and thought to be used as a read-all solution. The catchNodes is a flag to enable the selection of custom nodes.

Instance Variables:
	results	<Object>
	catchNodes	<Boolean>
	selectedNodes	<Object>