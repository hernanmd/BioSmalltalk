accessing
organization

	^ organization
		ifNil: [ organization := self defaultOrganization ]