accessing
adapterEngines
	" Answer a <Collection> of Engine classes "

	^ { 
		BioWebClientEngine . 
		BioSerializationEngine .
		BioExecutionEngine .
		BioOSInterfaceEngine
		}