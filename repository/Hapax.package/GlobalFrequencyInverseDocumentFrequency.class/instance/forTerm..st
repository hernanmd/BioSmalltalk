weighting
forTerm: aVector
	"The global weight function known as GFIDF, is the ratio of the global frequency of a term and the number
	of documents in which it appears: G(i) = gf(i)/df(i). By combining this with the trivial local weight function
	we get the conditional probability p(i,j)=tf(i,j)/gf(i) of the document j under condition that the term i appears,
	multiplied by df(i). The last number is proportional (multiplied by ndocs) to the probability of appearance of
	the term under the presupposition that the terms are chosen equally likely."

	^(self globalFrequency: aVector) / (self documentFrequency: aVector)