accessing
hasConnectorsInstalled

	^ PackageInfo allPackages anySatisfy: [:each | each externalName = #Connectors]