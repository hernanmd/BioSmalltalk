accessing
organization

	^ organization
		ifNil: [ organization := TGroupOrganization withAll: OrderedCollection new ]