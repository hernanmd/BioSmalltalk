accessing
performBehavior: cmpSymbol named: aSelector withArgument: argString

	^ self perform: aSelector withArguments: { argString . cmpSymbol }.
