*! version 0.01  20dec2010
program define wbdata
	version 11.1
	syntax varlist [if] [in] ///
		[, SEARCH(string) generate(varlist)]
	
	// building the query url
	query = "countries/ca"
	s = ( "http://api.worldbank.org/", query , "?format=json")
	url = invtokens( s, "" )
	
	// read and parse the json query result
	* injson(url)
	
	mata printf(fget(fopen(url, "r")))
	
end


/* ------------------------------------- */
* useful functions

injson ()
{

}