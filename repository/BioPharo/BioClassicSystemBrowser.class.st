"
BioClassicSystemBrowser can be used when other browser systems (like OmniBrowser) fail to open. Use it from the World Menu
"
Class {
	#name : #BioClassicSystemBrowser,
	#superclass : #ObjectExplorer,
	#category : 'BioPharo-Platform'
}

{ #category : #menu }
BioClassicSystemBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'Browser')
		order: 1; 
		parent: #Bio;
		label: 'Browser (Safe Mode)';
		icon: UITheme current smallSystemBrowserIcon;
		action:[Browser open]
]
