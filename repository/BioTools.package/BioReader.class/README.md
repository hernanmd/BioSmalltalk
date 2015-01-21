BioReader is an abstract class representing the base for all essential iteration operations using a specific parser. Basically exposes a generic iterator interface with the outside world. A reader is expected to take IO objects as input, like:

-FileStreams
-String representing a path to a file or directory
-Database tables
-etc

Typical responsabilities are implementing behavior to facilitate access to the parsing of input elements, this is mostly done overriding the #parserClass method and, in he case of XML input, accessing nodes through #accessNode:

Developers that wish to sequential processing of input with custom formats can simply specialize this subclass.

Instance Variables:
	contents		<String>		Contains the raw contents as retrieved from the initial user's instantiation.