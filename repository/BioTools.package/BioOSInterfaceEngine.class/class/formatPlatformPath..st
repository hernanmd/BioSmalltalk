accessing
formatPlatformPath: aPath
	" Make necessary transformations on aPath for the current system, e.g. 
	'C:\Archivos de Programa' -> ""C:\Archivos de Programa"" "
	
	^ self adapterClass new formatPlatformPath: aPath
