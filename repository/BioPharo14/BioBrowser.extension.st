Extension { #name : #BioBrowser }

{ #category : #'*biopharo14' }
BioBrowser classSide >> openBioBrowser [
	" Private - Open a browser containing BioSmalltalk classes "
	
	| instance pkgs env |

	pkgs := PackageOrganizer default packages select: [ :each | each packageName beginsWith: 'Bio' ].
	env := RBBrowserEnvironment new forPackages: pkgs.
	env label: 'BioSmalltalk'.
	env browserInstance open
]
