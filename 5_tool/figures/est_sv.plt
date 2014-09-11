reset
set term postscript eps enhanced color
#set term pngcairo dashed
set output "fig_est_sv.eps"
set size 0.6, 0.6
set xtics 1000
set samples 10000
set xlabel "Number of particles"
set ylabel "Run-time per step (s)"
set xrange [1:10000000000.0]
set yrange [0.00001:100]
set logscale x 10
set logscale y 10
set style func linespoints
set style line 1 lw 2 lt 1 pt 0 lc rgb 'red' 
set style line 2 lw 4 lt 2 pt 0 lc rgb '#006700'
set style line 3 lw 3 lt 3 pt 0 lc rgb '#006700'
set style line 4 lw 3 lt 2 pt 0 lc rgb 'blue'
set style line 5 lw 3 lt 1 pt 0 lc rgb 'blue'
set style line 6 lw 3 lt 9 pt 0 lc rgb 'blue'

y1(x) = 1/15360.0 * x

y2(x) = \
(x<200000000) ? 0.5 : 1/400000000.0 * x

plot \
y1(x) ls 1 axis x1y1 title "CPU" with linespoints, \
y2(x) ls 2 axis x1y1 title "This work" with linespoints
