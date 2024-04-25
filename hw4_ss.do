**================================================================================================================================================***	
**=======================April 23, 2024- Syntax for Homework 4 for Stata II (Intermediate)-Submitted By: Seema Subedi ==================================================================================================================***	
**================================================================================================================================================***

* Clear all
    cls
    clear all
    
** Set working Directory
    * See present working directory
    pwd 
    
    * Specify to use the present working directory, and specify separately for Windows and Mac
	if c(os)=="Windows" { //method for window
	    global workdir "`c(pwd)'\"
	}
	else { // method for mac 
	    global workdir "`c(pwd)'/"
	}

**Data Simulation:Initialize your dataset with 30 observations
    set obs 30
 
**Variable Generation
    *Create an age variable with a mean of 57 years and a standard deviation of 15. 
    *Use the command (to simulate a normal distribution)
        capture drop age
        gen age = (rnormal() * 15) + 57
        //qnorm age // to see normal distribution
        //graph box age
        //sum age, detail // median is 55
         //hist age, frequency normal
        
    
    *Alternatively, simulate a t-distribution. 
    *Type: help rt into the command window to read more. Or use other resources to appreciate why _N (degrees of freedom) might affect a t-distribution. It's beyond the scope of this class to decide which of these is appropriate.
        capture drop age_t
        gen age_t=(rt(_N)*15)+57
        
** Graphical Representation
   *Plot a histogram of the age variables from both rnormal() and rt(), and overlay it with a theoretical normal distribution curve. 
   *This visualization will help in understanding the distribution of age among the observations.
        
       hist age, ///
       fcolor(orange%40) /// simulated normal 
       addplot(hist age_t, fcolor(midblue%50)) /// agged the curve for simulated t-distribution 
       normal /// theoretical normal, that is showing the normal distribution
       legend(on ///
          lab(1 "Sampled from Normal") ///
          lab(2 "Theoretical Normal") ///
          lab(3 "Sampled from t-distribution") ///
          )

** Copying
    dyndoc index.do, saving(index.html) replace
    ls-l












