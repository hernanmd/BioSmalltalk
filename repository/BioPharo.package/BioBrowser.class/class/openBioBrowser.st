menu
openBioBrowser
	" Private - Open a browser containing BioSmalltalk classes "
	
	| instance pkgs env |

	pkgs := PackageOrganizer default packages select: [ :each | each packageName beginsWith: 'Bio' ].
	env := BrowserEnvironment new forPackages: pkgs.
	env label: 'BioSmalltalk'.
	env browserInstance open