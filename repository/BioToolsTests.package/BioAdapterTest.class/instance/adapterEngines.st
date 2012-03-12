accessing
adapterEngines
	" Answer a <Collection> of Engine classes "

	^ { 
		BioWebClientEngine . 
		BioWebServerEngine . 
		BioSerializationEngine .
		BioExecutionEngine
		}