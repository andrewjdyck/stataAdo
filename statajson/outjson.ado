*! 0.0.1 round one!
program outjson
	version 10.0
	syntax anything, [SAVing(string) Pretty]
	marksample touse
		
mata: writeJSON("`anything'")


// ---------------------------------- //

mata drop writeJSON()
string scalar writeJSON(string scalar varlist, string scalar usefile) {
	string matrix data
	st_view(data, ., tokens(varlist) )
	data = strofreal(data)
	json = "["
	n = rows(data)
	k = cols(data)
	names = tokens(varlist)
	filename = usefile

	for ( i=1; i<=n; i++ ) {
		if (i==1) {
			json = json + "{"
		} else {
			json = json + ",{"
		}
		for ( j=1; j<=k; j++ ) {
			json = json + names[1,j] + ":" + data[i,j]
			if ( j < k ) {
				json = json + ","
			}
		}
		json = json + "}"
	}
	json = json + "]"
	
	
	fwrite(fopen(filename, "w"), json)
	fclose(0)
}

mata drop pretty_json()
void pretty_json(string scalar json)
{
    json = json
    json = subinstr( json, `"{"',`"{\n"')
    json = subinstr( json, `"["', `"[\n"')
    json = subinstr( json, `",""', `",\n""')
    json = subinstr( json, `",["', `",\n["')
    json = subinstr( json, `""}"', `""\n}"')
    json = subinstr( json, `",{"', `",\n{"')
    json = subinstr( json, `":{"', `": {"')
    json = subinstr( json, `"},"', `"\n},\n"')
    printf(json)
}

end
* have a nice day!