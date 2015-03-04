reset
set term postscript eps enhanced color
set output "fig_recompute.eps"
set size 0.7, 0.7
set xlabel "Number of mantissa bits"
set xrange [4:53]
set ylabel "Ratio of re-computation R (\%)"
set yrange [0:7]
set ytics 0,1
set y2label "Number of points N_P processed in 1 ms (k)"
set y2range [0:14]
set y2tics 0, 2
set style func linespoints
set style line 1 lw 3 lt 12 pt 7 linecolor rgb "#FF0000" 
set style line 2 lw 3 lt 1 pt 6 linecolor rgb "#006400" 
plot \
'recompute.dat' using 1:3 ls 1 axis x1y1 title "Ratio of re-computation" with linespoints, \
'recompute.dat' using 1:2 ls 2 axis x1y2 title "Number of points" with linespoints
