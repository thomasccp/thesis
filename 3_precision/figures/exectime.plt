reset
set term postscript eps enhanced color
set output "fig_exectime.eps"
set size 0.7, 0.7
set xlabel "Number of mantissa bits"
set xrange [4:53]
set ylabel "Computation time T_{comp} (ms)"
set format y "%.0s"
set yrange [1:350]
set ytics nomirror
set y2label "Parallelism N_{pL}"
set y2range [0:10]
set y2tics 0,2
set style func linespoints
set style line 1 lw 2 lt 12 pt 5 linecolor rgb "#FF0000" 
set style line 2 lw 2 lt 1 pt 6 linecolor rgb "#006400" 
set style line 3 lw 2 lt 8 pt 7 linecolor rgb "#0000FF" 
plot \
'exectime.dat' using 1:2 ls 1 axis x1y1 title "Modelled computation time" with linespoints, \
'exectime.dat' using 1:4 ls 3 axis x1y1 title "Experimental computation time" with linespoints, \
'exectime.dat' using 1:3 ls 2 axis x1y2 title "Parallelism" with linespoints
