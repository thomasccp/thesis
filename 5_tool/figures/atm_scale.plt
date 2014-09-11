reset
set term postscript eps enhanced color
set output "fig_atm_scale.eps"
set size 0.7, 0.7
set xrange [3:21]
set yrange [:50000]
set logscale y
set xlabel "Number of aircraft"
set ylabel "Run time per step (s)" offset 2
set sample 19
set style line 1 lw 3 lt 1 pt 1 linecolor rgb 'red' 
set style line 2 lw 3 lt 1 pt 2 linecolor rgb '#006400'
set style line 3 lw 3 lt 1 pt 4 linecolor rgb 'blue' 
set style line 4 lw 3 lt 1 pt 5 linecolor rgb '#8B008B' 
set style line 5 lw 3 lt 1 pt 6 linecolor rgb '#4F4F4F' 
plot 'cpu.dat' using 1:2 w lp ls 1 title "CPU", \
'gpu.dat' using 1:2 w lp ls 2 title "GPU", \
'fpga.dat' using 1:2 w lp ls 3 title "Ours optimised", \
'fpga.dat' using 1:3 w lp ls 4 title "Ours unoptimised", \
"<echo 4 2.2" with points ls 5 title "Ref. FPGA [1]", \
30 w l lc 0 title "Real-time bound"
