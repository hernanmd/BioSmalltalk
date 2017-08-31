accessing
dataModel

	| dm |
	
	dm := Dictionary new.
	BioPanel subclasses do: [ : panelClass | 
			dm at: panelClass panelName put: panelClass ].
	^ dm
