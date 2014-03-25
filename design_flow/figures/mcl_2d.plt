reset
set term postscript eps enhanced color
set output "fig_mcl_2d.eps"
set samples 21
set isosample 21
set view 60,150
set xlabel "itl outer" font "Times-Roman, 20"
set xrange [1:15]
set ylabel "Np" offset -0.7,0 font "Times-Roman, 20" textcolor lt -1 rotate by -270
set yrange [1:15000]
set ytics out offset -2.5,0
set zlabel "RMSE (m)" offset -1 font "Times-Roman, 20"
set zrange [0:10]
set palette defined ( 0.5 0.5 0.5 0.5, 0.5 0.5 0.5 0.5)
unset colorbox

splot 'mcl_2d.dat' using 2:1:3 with lines notitle, 'mcl_2d.dat' using 2:1:($3>1?$3:1/0) with pm3d notitle, 'mcl_2d.dat' using 2:1:(($2*($1*8192/6+$1*8192+3*26*$1)/100000000)>10?$3:1/0) with pm3d notitle
