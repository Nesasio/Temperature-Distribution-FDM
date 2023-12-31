# 1-D Temperature Distribution in a Straight Fin using FDM 
This repository contains the implementation of steady state temperature dirstribution in a finite straight fin problem in [MATLAB](https://www.mathworks.com/products/matlab.html).
To determine the temperature distribution at the grid points [Finite Difference Method (FDM)](https://en.wikipedia.org/wiki/Finite_difference_method) was used.

## Parameters
- Length of the Fin: $L=4cm$
- Perimeter of the Fin: $P=40.4cm$
- Cross-section Area: $A_c=4cm^2$
- Base Temperature of the Fin: $T_b=225\degree C$
- Ambient Temperature: $T_\infty=25\degree C$
- Conductivity of the Fin Material: $k=45 W/m K$
- Convection Heat Transfer Coefficient: $h=15 W/m^2K$

## Analytical Solution
It is assumed that the tip of the fin is insulated. The analytical solution of the problem is as follows:
$$\frac{ T(x) - T_\infty }{ T_b - T_\infty } = \frac{ \cosh m(L - x) }{ \cosh mL }$$
where $\displaystyle m=\sqrt{ \frac{hP}{kA_c} }$

## Finite Difference Method
The temperature distribution is calculated at every grid point using FDM.
The distance between grid points $\Delta x$ is taken as $0.5cm$.

