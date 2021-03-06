reset
set term postscript eps enhanced color
set output "fig_atm_2d12.eps"
set samples 21
set isosample 21
set xlabel "Horizon length H"
set xlabel  offset character -3, -2, 0 font "" textcolor lt -1 norotate
set xrange [1:15]
set ylabel "Number of particles Np"
set ylabel  offset character 2, -1, 0 font "" textcolor lt -1 rotate by -270
set yrange [1:11000]
set zlabel "Run-time (s)"
set zlabel  offset character -5, 0, 0 font "" textcolor lt -1 norotate
set zrange [0:100]
set palette defined ( 0.5 0.5 0.5 0.5, 0.5 0.5 0.5 0.5)
unset colorbox

f12(x,y) = 20 * (170 * (y*12*x)/6 + (y*12+3*26*y)) /(220000000)
g12(x,y) = (x>2 & y>1000 & x*y>10000) ? 1/0 : 20 * (170 * (y*12*x)/6 + (y*12+3*26*y)) /(220000000)
h12(x,y) = (f12(x,y)<30) ? 1/0 : 20 * (170 * (y*12*x)/6 + (y*12+3*26*y)) /(220000000)
splot f12(x,y) with lines notitle, g12(x,y) with pm3d notitle, h12(x,y) with pm3d notitle
