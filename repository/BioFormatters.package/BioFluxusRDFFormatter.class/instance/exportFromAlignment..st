accessing
exportFromAlignment: aBioAlignment

	^ aBioAlignment do: [: seq |
			self stream 
				nextPut: $>;
				nextPutAll: seq name;
				space;
				nextPutAll: self frequencies;
				nextPutAll: seq asString;
				cr ]