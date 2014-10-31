Provides a list of the names of all valid Entrez databases
Provides statistics for a single database, including lists of indexing fields and available link names.

Required Parameters
=================
None. If no db parameter is provided, einfo will return a list of the names of all valid Entrez databases.

Optional Parameters
=================
db

Target database about which to gather statistics. Value must be a valid Entrez database name.

version

Used to specify version 2.0 EInfo XML. The only supported value is ‘2.0’. When present, EInfo will return XML that includes two new fields: <IsTruncatable> and <IsRangeable>. Fields that are truncatable allow the wildcard character ‘*’ in terms. The wildcard character will expand to match any set of characters up to a limit of 600 unique expansions. Fields that are rangeable allow the range operator ‘:’ to be placed between a lower and upper limit for the desired range (e.g. 2008:2010[pdat]).

retmode

Retrieval type. Determines the format of the returned output. The default value is ‘xml’ for EInfo XML, but ‘json’ is also supported to return output in JSON format.

Examples
========
Return a list of all Entrez database names:

http://eutils.ncbi.nlm.nih.gov/entrez/eutils/einfo.fcgi

Return version 2.0 statistics for Entrez Protein:

http://eutils.ncbi.nlm.nih.gov/entrez/eutils/einfo.fcgi?db=protein&version=2.0
