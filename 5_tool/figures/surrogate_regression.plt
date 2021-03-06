reset
set term postscript eps enhanced color
set output "fig_surrogate_regression.eps"
set size 0.5, 0.5
set xlabel "Parameter" font "Times-Roman, 20"
set xrange [0:11]
set ylabel "Objective function" font "Times-Roman, 20"
set yrange [0:10]
set label "invalid region" at 0.7,9 font "Times-Roman, 18"
set object 1 rectangle from 0,0 to 2.5,10 fs solid 0.5 noborder fc rgb "grey" behind
set style line 1 lw 3 lt 12 pt 3 linecolor rgb 'blue' 
plot 'surrogate.dat' using 1:2 ls 1 smooth csplines notitle, \
'' using 1:2 ls 1 notitle with points
