* Author: Andrew J Dyck *

* ************** CHANGE LOG ********************************************************
* Version 0.1 (September 11, 2009)
* 	- This program adjusts a variable for inflation
* **********************************************************************************

program define infladjust, rclass
	version 10, missing
	syntax varlist(min=1 max=1) [if] [in], INDex(name) GENerate(name) I(str) J(str) Baseyear(str) [ SAMple(str) ]
	
	marksample touse, novarlist
	tokenize `varlist'
	tempvar tnewvar check infl ycheck
	confirm new variable `generate'
	confirm variable `index'
	
	gen float `check' = 1 if `1' == . & `j' == `baseyear'
	gen `tnewvar' = `1'
	sum `index' if `j' == `baseyear'
	gen float `infl' = 1+(r(mean)-`index')/r(mean)
	
	qui tab `i'
	tempname idcount time1 time2
	local idcount = r(N)
	
	forvalues id = 1/`idcount' {
		gen float `ycheck' = `baseyear' - `j' if `1' > 0 & `1' != .
		sum `ycheck' if `i' == `id'
	}
	
	
	
	
	
	
	* Return items after the program has run.
	di as txt  `" (`nimps') observations imputed based on (`nn') observations"'
	return scalar imp = `nimps'
	return scalar imean = `mm'
	return scalar se = `sd' / sqrt( `nobs' )
	return scalar N = `nobs'
	
	

end