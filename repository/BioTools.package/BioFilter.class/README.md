BioFilter contains filtered results and manages its updates. 

By default a filter update its contents every time a filter is added to a reader with #addFilterFrom:. When #beCumulative is sent, instead of updating contents, this filter only returns the result of the filtering. This is useful for cases when you need to perform sucessive different filters over the same data set collecting new filter results.

Instance Variables:
	reader		<BioBlastReader>
	cumulative	<Boolean>
	contents		<BioFilteredResult>