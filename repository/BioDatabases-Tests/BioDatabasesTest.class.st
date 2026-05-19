Class {
	#name : 'BioDatabasesTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioDatabases-Tests',
	#package : 'BioDatabases-Tests'
}

{ #category : 'tests' }
BioDatabasesTest >> testAddAndRemoveDatabase [	| db testDB |	db := BioDatabases new.	testDB := BioDatabase type: #tertiary category: 'Test' name: 'TestDB' description: 'Test'.	db addDatabase: testDB.	self assert: db size equals: 1.	db removeDatabase: testDB.	self assert: db size equals: 0
]

{ #category : 'tests' }
BioDatabasesTest >> testAllDatabases [	| db |	db := BioDatabases withAllDatabases.	self assert: db size > 300.	self assert: db size = 654
]

{ #category : 'tests' }
BioDatabasesTest >> testBioDatabaseCreation [	| db |	db := BioDatabase type: #primary category: 'Test' name: 'TestDB' description: 'A test database'.	self assert: db type equals: #primary.	self assert: db category equals: 'Test'.	self assert: db name equals: 'TestDB'.	self assert: db description equals: 'A test database'.	self assert: db url isNil.	self assert: db status isNil
]

{ #category : 'tests' }
BioDatabasesTest >> testBioDatabasePrintOn [	| db str |	db := BioDatabase type: #primary category: 'Test' name: 'MyDB' description: 'Desc'.	str := String streamContents: [ :s | db printOn: s ].	self assert: (str includesSubstring: 'MyDB')
]

{ #category : 'tests' }
BioDatabasesTest >> testCategories [	| db |	db := BioDatabases withAllDatabases.	self assert: db categories size >= 30.	self assert: (db categories includes: 'Protein').	self assert: (db categories includes: 'Immunogenetics')
]

{ #category : 'tests' }
BioDatabasesTest >> testCategorySelectors [	| sels |	sels := BioDatabases categorySelectors.	self assert: sels size >= 30.	self assert: (sels includes: #proteinDatabases).	self assert: (sels includes: #immunogeneticsDatabases).	self deny: (sels includes: #allDatabases)
]

{ #category : 'tests' }
BioDatabasesTest >> testDatabaseUrls [	"All databases should have a URL."	| db |	db := BioDatabases withAllDatabases.	db databases do: [ :d |		self assert: d url notNil.		self assert: d url notEmpty ]
]

{ #category : 'tests' }
BioDatabasesTest >> testFilterByCategories [	| db |	db := BioDatabases withAllDatabases.	self assert: (db byCategories: #('Protein' 'RNA')) size >= 40.	self assert: (db byCategories: #('Nonexistent')) size = 0
]

{ #category : 'tests' }
BioDatabasesTest >> testFilterByCategory [	| db |	db := BioDatabases withAllDatabases.	self assert: (db byCategory: 'Protein') size >= 25.	self assert: (db byCategory: 'RNA') size >= 15.	self assert: (db byCategory: 'Nonexistent') size = 0
]

{ #category : 'tests' }
BioDatabasesTest >> testFilterByType [	| db |	db := BioDatabases withAllDatabases.	self assert: (db byType: #primary) size > 400.	self assert: (db byType: #secondary) size > 100.	self assert: (db byType: #tertiary) size = 0
]

{ #category : 'tests' }
BioDatabasesTest >> testFilterByTypes [	| db |	db := BioDatabases withAllDatabases.	self assert: ((db byTypes: #(primary secondary)) size) = db size.	self assert: (db byTypes: #(tertiary)) size = 0
]

{ #category : 'tests' }
BioDatabasesTest >> testPrimaryDatabases [	| db |	db := BioDatabases withPrimaryDatabases.	self assert: db size > 400.	self assert: (db databases allSatisfy: [ :d | d type = #primary ])
]

{ #category : 'tests' }
BioDatabasesTest >> testSearchByKeyword [	| db |	db := BioDatabases withAllDatabases.	self assert: (db searchKeyword: 'malaria') size >= 1.	self assert: (db searchKeyword: 'Malaria') size >= 1.	self assert: (db searchKeyword: 'nonexistent') size = 0
]

{ #category : 'tests' }
BioDatabasesTest >> testSearchByName [	| db |	db := BioDatabases withAllDatabases.	self assert: (db searchName: 'PDB') size >= 1.	self assert: (db byName: 'PDB') size >= 1.	self assert: (db searchName: 'zzzzzzzzzzz') size = 0
]

{ #category : 'tests' }
BioDatabasesTest >> testSecondaryDatabases [	| db |	db := BioDatabases withSecondaryDatabases.	self assert: db size > 100.	self assert: (db databases allSatisfy: [ :d | d type = #secondary ])
]

{ #category : 'tests' }
BioDatabasesTest >> testTypes [	| db |	db := BioDatabases withAllDatabases.	self assert: (db types includes: #primary).	self assert: (db types includes: #secondary)
]
