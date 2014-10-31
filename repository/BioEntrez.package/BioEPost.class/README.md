Uploads a list of UIDs to the Entrez History server

Appends a list of UIDs to an existing set of UID lists attached to a Web Environment

Required Parameters
=================
db

Database containing the UIDs in the input list. The value must be a valid Entrez database name (default = pubmed).

id

UID list. Either a single UID or a comma-delimited list of UIDs may be provided. All of the UIDs must be from the database specified by db. There is no set maximum for the number of UIDs that can be passed to epost, but if more than about 200 UIDs are to be posted, the request should be made using the HTTP POST method.

epost.fcgi?db=protein&id=15718680,157427902,119703751

