testing
testGroupBy01

	| clusters dictionaryClass |
	clusters := BioGroupOrganization forEqualityOn: #value.
	self trainedSet02 do: [ : feature | clusters addOrganization: (BioOrganization new feature: feature) ].
	classifier := BioClassifier new organization: clusters.
	self subjects02 do: [ : subject | classifier classify: subject ].
	dictionaryClass := PluggableDictionary.
	
	self assert: (classifier groupBy: #value) equals: (OrderedCollection new 
				add: (dictionaryClass new 
						add: ('United Kingdom: Dudley Castle' -> (OrderedCollection new 
							add: 'United Kingdom: Dudley Castle'; 
							add: 'United Kingdom: Dudley Castle'; 
							yourself)); 
						yourself); 
				add: (dictionaryClass new 
						add: ('Japan:Shimane,Kisuki'->(OrderedCollection new 
							add: 'Japan:Shimane,Kisuki'; 
							add: 'Japan:Shimane,Kisuki'; 
							yourself)); 
						yourself); 
				add: (dictionaryClass new 
						add: ('Philippines:Ilocos Norte,Barangay,Pardan,Sarrat'->(OrderedCollection new 
							add: 'Philippines:Ilocos Norte,Barangay,Pardan,Sarrat'; 
							yourself)); 
						yourself); 
				add: (dictionaryClass new 
						add: ('Japan:Hokkaido,Otofuke,Namiki 8'->(OrderedCollection new 
							add: 'Japan:Hokkaido,Otofuke,Namiki 8'; 
							yourself)); 
						yourself); 
				add: (dictionaryClass new 
					add: ('China: Sichuan Province' -> (OrderedCollection new 
							add: 'China: Sichuan Province'; 
							add: 'China: Sichuan Province'; 
							yourself)); 
						yourself); 
				yourself ).
