*BioPharo3
itemsForAnyFile
	"Answer a list of universal services that could apply to any file"
	
	| services |
	services := OrderedCollection new: 5.
	services add: self serviceCopyName. 
	services add: self serviceRenameFile. 
	services add: self serviceDeleteFile.
	services add: self serviceViewContentsInWorkspace.
	services add: self serviceBioMaterialize.
	^ services