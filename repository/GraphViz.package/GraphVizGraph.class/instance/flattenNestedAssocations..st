private
flattenNestedAssocations: association

	 | flattened currentNode associations |

	flattened := OrderedCollection new.
	currentNode := association.

	[currentNode isVariableBinding] whileTrue: 
		[flattened add: currentNode value.
		currentNode := currentNode key].

	flattened add: currentNode.
	flattened := flattened reversed.

	associations := OrderedCollection new.
	1 to: flattened size - 1 do: [:i | associations add: (flattened at: i) -> (flattened at: i + 1)].

	^ associations