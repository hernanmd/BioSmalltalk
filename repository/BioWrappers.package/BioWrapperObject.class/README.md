A wrapper is an object which expands on what another object (the wrappee) does, without being concerned about the implementation of the wrappee.

A wrapper enables configuration and makes possible the messaging of another object (i.e. an external software).

You can add three types of things to a wrapped object:

- Parameters
- Options 		An option has only a name.
- Properties 		A property has a name and a value, delimited by a #propertySeparator

The key method for wrapper debugging is #buildCmdLine.

Instance Variables
	cmdLine:			<String>
	lastStatus:			<Boolean>
	options:				<OrderedCollection>
	parameters:			<OrderedCollection>
	programName:		<String>

cmdLine
	- xxxxx

lastStatus
	- <true> if last execution was successful.

options
	- xxxxx

parameters
	- xxxxx

programName
	- xxxxx
