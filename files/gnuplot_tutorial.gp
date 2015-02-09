# - The hashtags define comment lines by default in gnuplot; you can change the comment symbol using 

set datafile commentschars "#%"

# This will tell the gnuplot shell that the characters '#' and '%' starts a comment line.

# What is Gnuplot?
# Gnuplot is a command line plotting program built on top of the Bash shell that is capable of producing publication/presentation worthy figures through interactive commands or scripts.

# Why is Gnuplot Useful?
# - Quickly plot up data files
# - Basic fitting routines
# - Produce 2D, 3D, and contour plots
# - It has common built in functions related to plotting

#
#      __________________________________________________________
#      Function            Returns
#      -----------      ------------------------------------------
#      abs(x)            absolute value of x, |x|
#      acos(x)           arc-cosine  of x
#      asin(x)           arc-sine    of x  
#      atan(x)           arc-tangent of x
#      cos(x)            cosine      of x,  x is in radians.
#      cosh(x)           hyperbolic cosine of x, x is in radians
#      erf(x)            error function of x
#      exp(x)            exponential function of x, base e
#      inverf(x)         inverse error function of x
#      invnorm(x)        inverse normal distribution of x
#      log(x)            log of x, base e
#      log10(x)          log of x, base 10
#      norm(x)           normal Gaussian distribution function
#      rand(x)           pseudo-random number generator      
#      sgn(x)            1 if x > 0, -1 if x < 0, 0 if x=0
#      sin(x)            sine      of x, x is in radians
#      sinh(x)           hyperbolic sine of x, x is in radians
#      sqrt(x)           the square root of x
#      tan(x)            tangent of x, x is in radians
#      tanh(x)           hyperbolic tangent of x, x is in radians
#      ___________________________________________________________
#      Bessel, gamma, ibeta, igamma, and lgamma functions are also
#      supported.  Many functions can take complex arguments.
#      Binary and unary operators are also supported.   

f(x) = exp(x) * sin(10 * x)

# plotting one function with lines
plot [0:5] [-100:100] f(x) w lines lt -1
pause(2)

set xlabel 'This is the $x$-axis'
set ylabel 'This is the $y$-axis'
set title 'This is the title'

# plotting the same function with squares
plot [0:5] [-100:100] f(x) w points lt -1 pt 5 ps 2
pause(2)

# plotting the same function with both lines and points
plot [0:5] [-100:100] f(x) w linespoints lt 1 lw 2 pt 13 ps 2 title 'my function'
pause(2)

#   lt  colour      pt  point
#   -1	black		-1	n/a
#   0	black		0	dotted
#   1	red		    1	+
#   2	green		2	x
#   3	blue		3	*
#   4	magenta		4	empty square
#   5	cyan		5	filled square
#   6	brown		6	empty circle
#   7	light brown	7	filled circle
#   8	light red	8	empty triangle
#        -----------
#   9	red		    9	filled triangle
#   10	green		10	empty nabla
#   11	blue		11	filled nabla
#   12	magenta		12	empty rhombus
#   13	cyan		13	filled rhombus
#				--------------
#   14	brown		14	+
#   15	light brown	15	x

g(x) = 5 * sin(x)
h(x) = 2.0 * ( (x / 5.0) - floor(0.5 + x / 5.0))

# plot multiple functions at once
plot [0:5] [-10:10] h(x) w lines lt -1 title 'Sawtooth function', g(x) w points title '$5\sin(x)$', f(x) w linespoints pt 13 ps 2 lt 3
pause(2)

# move the legend to the other side
set key top left
plot [0:5] [-10:10] h(x) w lines lt -1 title 'Sawtooth function', g(x) w points title '$5\sin(x)$', f(x) w linespoints pt 13 ps 2 lt 3
pause(2)

# how can I make latex work!?
set term epslatex color size 15cm, 10cm
set output 'plot.tex'
set title 'Title using \LaTeX'
plot [0:5] [-10:10] h(x) w lines lt -1 title 'Sawtooth function', g(x) w points title '$5\sin(x)$', f(x) w linespoints pt 13 ps 2 lt 3

# what if I want a png image?
set term png 
set output 'plot.png'
set title 'Title for png image'
plot [0:5] [-10:10] h(x) w lines lt -1 title 'Sawtooth function', g(x) w points title '$5\sin(x)$', f(x) w linespoints pt 13 ps 2 lt 3

############ PLOTTING A DATA FILE #############

set term x11

# plot the 1st and 3rd column of a data file
plot 'data.dat' u 1:3 w lines
pause(2)

# plot the 2nd and 3rd column of a data file
plot 'data.dat' u 2:3 w lines
pause(2)

# plot both the 1st and 3rd column and the 2nd and 3rd column of the data file
plot 'data.dat' u 1:3 w lines title 'x-component', 'data.dat' u 2:3 w points title 'y-component'
pause(2)

############ PLOTTING A DATA FILE USING SPLOT #############

# define the colours for the 2d plots
set palette defined(\
0       0.2314  0.2980  0.7529,\
0.03125 0.2667  0.3529  0.8000,\
0.0625  0.3020  0.4078  0.8431,\
0.09375 0.3412  0.4588  0.8824,\
0.125   0.3843  0.5098  0.9176,\
0.15625 0.4235  0.5569  0.9451,\
0.1875  0.4667  0.6039  0.9686,\
0.21875 0.5098  0.6471  0.9843,\
0.25    0.5529  0.6902  0.9961,\
0.28125 0.5961  0.7255  1.0000,\
0.3125  0.6392  0.7608  1.0000,\
0.34375 0.6824  0.7882  0.9922,\
0.375   0.7216  0.8157  0.9765,\
0.40625 0.7608  0.8353  0.9569,\
0.4375  0.8000  0.8510  0.9333,\
0.46875 0.8353  0.8588  0.9020,\
0.5     0.8667  0.8667  0.8667,\
0.53125 0.8980  0.8471  0.8196,\
0.5625  0.9255  0.8275  0.7725,\
0.59375 0.9451  0.8000  0.7255,\
0.625   0.9608  0.7686  0.6784,\
0.65625 0.9686  0.7333  0.6275,\
0.6875  0.9686  0.6941  0.5804,\
0.71875 0.9686  0.6510  0.5294,\
0.75    0.9569  0.6039  0.4824,\
0.78125 0.9451  0.5529  0.4353,\
0.8125  0.9255  0.4980  0.3882,\
0.84375 0.8980  0.4392  0.3451,\
0.875   0.8706  0.3765  0.3020,\
0.90625 0.8353  0.3137  0.2588,\
0.9375  0.7961  0.2431  0.2196,\
0.96875 0.7529  0.1569  0.1843,\
1       0.7059  0.0157  0.1490) 

# plot the data
splot 'data.dat' u 1:2:3 w pm3d title '2D Gaussian function'
pause(-1)
