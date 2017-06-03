accessing - meta
addMetaAssemblyURL: urlString
	" Add breakpoint assemblies for structural variations may use an external file "

	self stream
		nextPutAll: '##assembly=';
		nextPutAll: urlString;
		bioCr
