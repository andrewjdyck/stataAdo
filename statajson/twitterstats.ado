*! version 0.01  20dec2010
program define twitterstats
	version 11.1
	syntax varlist [if] [in] ///
		[, SEARCH(string) generate(varlist)]
	
	// building the query url
	query = "q=@Stata"
	num = "&rpp=10"
	s = ( "http://search.twitter.com/search.json?", query, num )
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