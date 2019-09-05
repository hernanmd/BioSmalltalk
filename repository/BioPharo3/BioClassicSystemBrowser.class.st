"
Helper class to open the classic and old Smalltalk Class Hierarchy Browser. Use it from the main menu.


"
Class {
	#name : #BioClassicSystemBrowser,
	#superclass : #ObjectExplorer,
	#category : 'BioPharo3-Core'
}

{ #category : #menu }
BioClassicSystemBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'Browser')
		order: 1; 
		parent: #Bio;
		label: 'Browser (Classic)';
		icon: Smalltalk ui icons smallSystemBrowserIcon;
		action: [ Browser open ]
]
