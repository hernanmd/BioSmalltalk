"
Helper class to open a scoped Nautilus Browser with BioSmalltalk classes and extensions. Use it from the main menu or by evaluating the following expression:

BioBrowser openBioBrowser

"
Class {
	#name : #BioBrowser,
	#superclass : #ObjectExplorer,
	#category : 'BioPharo3-Core'
}

{ #category : #menu }
BioBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'BioBrowser')
		order: 1; 
		parent: #Bio;
		label: 'BioBrowser (Nautilus)';
		icon: Smalltalk ui icons smallHierarchyBrowserIcon;
		help: 'Browse the BioSmalltalk classes' translated;
		action:[self openBioBrowser]
]

{ #category : #menu }
BioBrowser class >> openBioBrowser [
	" Private - Open a browser containing BioSmalltalk classes "
	
	| pkgs env |

	pkgs := RPackageOrganizer default packages select: [ :each | each packageName beginsWith: 'Bio' ].
	env := RBBrowserEnvironment new forPackages: pkgs.
	env label: 'BioSmalltalk'.
	Nautilus openInEnvironment: env
]
