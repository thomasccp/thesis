reset
set term postscript eps enhanced color
set output "fig_surrogate_sampling.eps"
set size 0.5, 0.5
set xlabel "Parameter X" font "Times-Roman, 20"
set xrange [0:11]
set ylabel "Objective function" font "Times-Roman, 20"
set yrange [0:10]
set style line 1 lw 3 lt 12 pt 3 linecolor rgb 'blue' 
plot 'surrogate.dat' using 1:2 ls 1 notitle
