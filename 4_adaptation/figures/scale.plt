reset
set term postscript eps enhanced color
set output "fig_scale.eps"
set size 0.7, 0.7
set xlabel "Energy consumtpion (J)"
set log y
set ylabel "Run-time per time-step (s)"
set xrange [0:5200]
set yrange [0.01:500]
set style func linespoints
set style line 1 lw 3 lt 1 pt 6 linecolor rgb "#FF0000" 
set style line 2 lw 3 lt 1 pt 6 linecolor rgb "#00FF00" 
set style line 3 lw 3 lt 1 pt 6 linecolor rgb "#0000FF" 
set style line 4 lw 1 lt 1 pt 0 linecolor rgb "#000000" 
#set key left
set label "CPU(1)" at 4500, 50
#set label "2 threads" at 3000, 7
#set label "8 threads" at 350, 7
set label "CPU(2)" at 1500, 12
set label "RS(1)" at 200, 0.3
set label "RS(2)" at 2100, 0.25
set label "RS(3)" at 1800, 0.09
set label "GPU(1)" at 500, 2.4
set label "GPU(2)" at 1600, 1.1
set label "GPU(3)" at 2300, 0.5

y(x) = 5

plot \
'scale.dat' using 8:9 ls 1 axis x1y1 notitle with linespoints, \
'scale.dat' using 5:6 ls 2 axis x1y1 notitle with linespoints, \
'scale.dat' using 2:3 ls 3 axis x1y1 notitle with linespoints, \
y(x) ls 4 title "Real-time bound" with linespoints
