# Derive seismic fragility curves for URM building in Basel

## Description

This folder contains the following files :  
 
* capacity_curves_comparison.m
* capacity_curves_M3_L_FF_mean.csv
* capacity_curves_M3_L_FF_span_L_400.csv
* READ_ME.md

In this example, the modification made on the initial configuration is the following: an increase of the length of the spandrel.

For a first check whether the modification made is relevant or not, only the mean values of the material parameters (elastic modulus, cohesion and friction coefficient) are used. Therefore, the file capacity_curves_M3_L_FF_span_L_400.csv has always the same values for T, Sy and Sdu as no statistical distribution of the material parameters has been made.

Before going further and deriving the fragility curves, the capacity curve can be analyzed and gives already a first idea about the relevance of the modification. The comparison is made with the 1000 capacity curves (capacity_curves_M3_L_FF_mean.csv) of the initial configuration.

The graph shows an increase of Sdy (but the values Sdu are quite similar). To get closer to the empirical fragility curve one need an increase in Sdy. Therefore, the modification seems to be relevant and deriving the corresponding fragility curve is of interest.  
(As deriving the fragility curve needs more complex steps and codes, it is left out.)

## Getting started

### Installing

The code is run with Matlab.  
The programming and numeric computing platform can be downloaded here:
[https://ch.mathworks.com/help/install/install-products.html]()

### Executing program

1. Open capacity_curves_comparison.m  
2. Run the code 
3. A plot of the capacity curves should appear

### Data

The code uses two datasets that have already been generated previsouly:  

* capacity_curves_M3_L_FF_mean.csv
* capacity_curves_M3_L_FF_span_L_400.csv

It corresponds to the values of [Sdy, Sdu, Ty] that have been generated for 1000 capacity curves using a statiscal distribution. 

## Author

[Hugo Nick](hugo.nick@epfl.ch)

## License







