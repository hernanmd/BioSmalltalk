accessing
modificationTimeOf: aString

	^ (FileDirectory directoryEntryFor: aString) ifNotNilDo: [:entry | entry modificationTime]