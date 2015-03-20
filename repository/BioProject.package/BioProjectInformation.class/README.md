Instance Variables:
	history			<BioProjectHistory>	
	usage			<BioProjectUsage>		
	credentials		<ProtoObject | PseudoContext>	
	project			<GTProject>		
						

history
	- The project history object is responsible of registering information about a project, for example: Project Creation, Deletion, Modification.

usage
	- The project usage is responsible to maintain information, for example: Project users, last accesses, data set unions, intersections, etc.

project
	- Link to the project which owns the project information