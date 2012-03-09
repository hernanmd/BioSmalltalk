BioBLASTNode is the abstract class grouping all behavior related to constructing a tree from XML BLAST parsing. Refer to the BioBlastXMLParserTest to find how subclasses are used.

Instead of representing each node as a class, this hierarchy abstracts classes for node 'types' found in the XML DTD. This class only provides naming for nodes built by subclasses.

Instance Variables:
	nodeName	<String>