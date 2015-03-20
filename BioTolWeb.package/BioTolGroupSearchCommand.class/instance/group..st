accessing
group: aGroupId
	" Set ther receiver's group for the group service "

	self url queryAt: 'group' put: aGroupId asString