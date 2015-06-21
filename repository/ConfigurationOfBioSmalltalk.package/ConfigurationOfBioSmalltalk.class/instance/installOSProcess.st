doits
installOSProcess

	Gofer new
		squeaksource: 'MetacelloRepository';
		package: 'ConfigurationOfOSProcess';
		load.
	((Smalltalk at: #ConfigurationOfOSProcess) project version: '4.6.4') load.