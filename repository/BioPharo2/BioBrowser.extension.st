Extension { #name : #BioBrowser }

{ #category : #'*biopharo2' }
BioBrowser classSide >> openBioBrowser [
	" Private - Open a browser containing BioSmalltalk classes "
	
	| pkgs env |

	pkgs := RPackageOrganizer default packages select: [ :each | each packageName beginsWith: 'Bio' ].
	env := RBBrowserEnvironment new forPackages: pkgs.
	env label: 'BioSmalltalk'.
	Nautilus openInEnvironment: env
]
