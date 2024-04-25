
<<dd_version: 2>>     
<<dd_include: header.txt>>

# <p style="text-align: center;"> Home Work 4 for Stata II (Intermediate) Class</p>

## Learning Markdown and Latex and html

### By- Seema Subedi

**1.Background:** 
    
This homework was created in order to help the students practise creating html file (website) that includes
background;  method with some codes; results with some graphs and mathematical notations; and conclusion. 

For enhancing the aesthetics of my .html file , I uploaded different files in the github work repository as:

This is my [stmarkdown.css] (https://github.com/seemazzz/hw4_intermediate/blob/main/stmarkdown.css) file

This is my [header.txt](https://github.com/seemazzz/hw4_intermediate/blob/main/header.txt) file

**2.Methods:** 

First, a variable "age" was created, once with a normal distribution of ages, and second with the 
t-distribition of ages, using a simulated data.
Then, in a single figure (<u>overlay histogram</u>), those distributions were plotted together to show how different the distributions look visually.

 **Codes for generating simulated data, creating variables and making graphs**
 
```
<<dd_do:nooutput>>
    **Clear all
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
        set seed 521774
        set obs 30

    **Variable Generation
        *Create an age variable with a mean of 57 years and a standard deviation of 15. 
        *Use the command (to simulate a normal distribution)
        capture drop age
        gen age = (rnormal() * 15) + 57
    
        *Alternatively, simulate a t-distribution.
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
  
       *Export Graph
      graph export histogram.png, replace
           
 <</dd_do>>
```        


**3.Results:**

```
<<dd_do:nooutput>>
   quietly 
   {
    display c(N) 
    display c(k)  
   
    sum age, detail
    display r(sd)
    display r(mean) 
    local mean_n =r(mean) 
    local sd_n=r(sd)
    
    sum age_t, detail
    display r(sd)
    display r(mean) 
    local mean_t =r(mean) 
    local sd_t=r(sd)
   }
   <</dd_do>>
   
```   

The results in this analysis are based on simulated data.
There are <<dd_display: c(N)>> number of observations and <<dd_display: c(k) >> variables in the simulated dataset.

**Figure 1:Graph showing different distribution of ages**

<<dd_graph>>




*$\text{Age(years) in Normal Distribution} \sim \mathcal{N}(\mu=<<dd_display: `mean_n'>>,\,\sigma=<<dd_display: `sd_n'>>)$*
*$\text{Age(years) in T-distribution} \sim \mathcal{t}(\mu=<<dd_display: `mean_t'>>,\,\sigma=<<dd_display: `sd_t'>>)$*

**4.Conclusion:**
The histogram clearly shows that though the two distributions had similar mean and SD of age,
they have different shapes and tail behaviour. While the normal distribution yields a bell-shaped curve, 
the t-distribution exhibits slightly heavier tail, which indicates that there is a greater likelihood of extreme age values. 
It shows the importance of understanding the shape of distribution of variables before implementing further statistical analysis.

