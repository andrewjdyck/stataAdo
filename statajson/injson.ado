*! version 0.01  20dec2010
program define injson
	version 11.1
	
	* stuff goes here
	
end


// ------------------------------------- 
// useful functions

void pretty_json(string scalar url) // function to pretty format a json string
{	
	b = fget( fopen( url, "r" ) )
	b = subinstr( b, `"{"',`"{\n"')
	b = subinstr( b, `"["', `"[\n"')
	b = subinstr( b, `",""', `",\n""')
	b = subinstr( b, `",["', `",\n["')
	b = subinstr( b, `""}"', `""\n}"')
	b = subinstr( b, `",{"', `",\n{"')
	b = subinstr( b, `":{"', `": {"')
	b = subinstr( b, `"},"', `"\n},\n"')
	printf(b)
}



parse_json ( json_str ) {
	// function to read json string to an array
	
	// some old mata code 
	// A = asarray_create()
	// i = 1
	// parse_values(substr(json,i,1))

	
	
	var at,     // The index of the current character
        ch,     // The current character
        escapee = {
            '"':  '"',
            '\\': '\\',
            '/':  '/',
            b:    '\b',
            f:    '\f',
            n:    '\n',
            r:    '\r',
            t:    '\t'
        },
        text,
		error	// need some error handling
		
		
	string scalar next( string scalar c ) {
		*// If c is provided, checks that it matches current character
		if ( c & c != ch ) {
			break??
		}
		
		*// get the next character. If there are none return empty string
		ch = substr(json_str, at, 1)
		at = at + 1
		return(ch)
	}
	
	void number() {
	// parses a number value
		string = ""
		number = ""
		if (ch == '-') {
                string = '-'
                next('-')
            }
		while (ch >= '0' && ch <= '9') {
			string += ch
			next()
		}
		if (ch === '.') {
			string += '.'
			while (next() && ch >= '0' && ch <= '9') {
				string += ch
			}
		}
		if (ch === 'e' || ch === 'E') {
			string += ch
			next()
			if (ch == '-' || ch == '+') {
				string += ch
				next()
			}
			while (ch >= '0' && ch <= '9') {
				string += ch
				next()
			}
		}
		number = +string;
		// need error checking for NaNs
		return(number)
		
	}
	
}


end