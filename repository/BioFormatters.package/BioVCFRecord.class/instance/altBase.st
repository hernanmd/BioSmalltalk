accessing
altBase
	" Answer a <String> of alterante base(s) - alternate non-reference alleles. These alleles do not have to be called in any of the samples. Options are base Strings made up of the bases A,C,G,T,N,*, (case insensitive) or  an  angle-bracketed  ID  String  (“<ID>”)  or  a  breakend  replacement  string  as  described  in  the  section  on breakends. The ‘*’ allele is reserved to indicate that the allele is missing due to a upstream deletion.  If there are no alternative alleles, then the missing value should be used.  Tools processing VCF files are not required to preserve case in the allele String, except for IDs, which are case sensitive. (String; no whitespace, commas, or angle-brackets are permitted in the ID String itself) "

	^ altBase