* Author: Andrew J Dyck *

* ************** CHANGE LOG ********************************************************
* Version 0.1 (August 23, 2009)
* 	- This program estimates missing values for a variable of interest using the mean of a ratio 
*		of this variable to another related variable.
*	- The skeleton of this program is in working order, however, the program is not intelligent
*		and must be used as it was intended or it will output potentially spurious results.
*	- Meanpute accepts two arguments. The first must be the variable of interest with missing
*		values and the second must be the related variable with no missing values.
*	- See the methodology of Sumaila et al. (in press) "A bottom-up re-estimation of global 
*		fisheries subsidies" for an example of how this program can be used
* **********************************************************************************
* Version 0.15 (August 25, 2009)
*	- Meanpute is now r-class. Added some return scalars that can be accessed post-estimation
* **********************************************************************************

program define meanpute, rclass
	version 10, missing
	syntax varlist(min=2 max=2) [if] [in], GENerate(name) 
	
	marksample touse, novarlist
	tokenize `varlist'
	tempvar ratio tnewvar
	confirm new variable `generate'

	qui { 
		gen float `ratio' = `1'/`2' if `touse'
		sum `ratio'
		gen float `tnewvar' = `1' if `touse'
		tempname mm sd nobs
		scalar `nobs' = r(N)
		scalar `sd' = r(sd)
		scalar `mm' = r(mean)
	
		count if missing(`tnewvar') & `touse'
		local nimps = r(N)
		replace `tnewvar' = `mm'*`2' if `tnewvar' == . & `touse'
		rename `tnewvar' `generate'
	}

	di as txt  `" (`nimps') observations imputed"'
	
	return scalar imp = `nimps'
	return scalar imean = `mm'
	return scalar se = `sd' / sqrt( `nobs' )
	return scalar N = `nobs'

end

