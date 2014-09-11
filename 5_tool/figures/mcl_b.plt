reset
set term postscript eps enhanced color
set output "fig_mcl_b.eps"
set size 0.7, 0.7
set xlabel "itl_outer"
set xrange [0:16]
set ylabel "RMSE (m)"
set yrange [0:10]
#set object 1 rectangle from 1,0 to 768,30 fs solid 0.5 noborder fc rgb "grey" behind
set style line 1 lw 3 lt 1 pt 4 linecolor rgb 'red' 
set style line 2 lw 3 lt 1 pt 5 linecolor rgb '#006400'
set style line 3 lw 3 lt 1 pt 6 linecolor rgb 'blue' 
plot 'mcl_b.dat' using 1:2 ls 1 title 'Np = 1000' with linespoints, \
'mcl_b.dat' using 1:4 ls 2 title 'Np = 5000' with linespoints, \
'mcl_b.dat' using 1:6 ls 3 title 'Np = 9000' with linespoints
