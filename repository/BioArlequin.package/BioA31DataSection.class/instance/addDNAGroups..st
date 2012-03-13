accessing
addDNAGroups: groupCollection

	groupCollection do: [: group |
		self 
			buildDNASample: 	group data 
			title: 				group name
		].