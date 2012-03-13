querying
locationsWithoutPrefixes

	^ ( self locations collect: [: loc | self removePrefixes: loc ] ) gather: [: e | e ]