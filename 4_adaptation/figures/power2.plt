reset
set term postscript eps enhanced color
set output "fig_power2.eps"
#set term pngcairo dashed
#set output "fig_power2.png"
set size 0.8, 0.8
set xtics 5
set samples 50
set xlabel "Wall-clock time (s)"
set ylabel "Power (W)"
set xrange [0:10]
set yrange [0:700]
set style func linespoints
set style line 1 lt 1 lc rgb 'red' 
set style line 2 lt 2 lc rgb '#006700'
set style line 3 lt 4 lc rgb '#006700'
set style line 4 lt 5 lc rgb 'blue'
set style line 5 lt 6 lc rgb 'blue'
set style line 6 lt 7 lc rgb 'blue'
set style line 7 lt 2 lc rgb 'gray'
set arrow from 5,0 to 5,700 nohead ls 7

y1(x) = \
(x<0+6.697) ? 279 : (x<10) ? 133 : \
(x<10+3.349) ? 279 : (x<20) ? 133 : 279

y2(x) = \
(x<0+1.477) ? 287 : (x<5) ? 208 : \
(x<5+0.739) ? 287 : (x<10) ? 208 : 287

y2b(x) = \
(x<0+0.797) ? 366 : (x<5) ? 300 : \
(x<5+0.399) ? 366 : (x<10) ? 300 : 366

y3(x) = \
(x<0.569) 	? 	145 : (x<0.569+0.8)   	? 	110 : (x<5-0.8)   ? 95 : (x<5) 	? 	110 : \
(x<5.285) 	? 	145 : (x<5.285+0.8)   	? 	110 : (x<10-0.8)   ? 95 : (x<10) 	? 	110 : 110

y4(x) = \
(x<0.215) 	? 	420 : (x<0.2150+0.8)   	? 	400 : (x<5-0.8)   ? 360 : (x<5) 	? 	400 : \
(x<5.215) 	? 	420 : (x<5.2150+0.8)   	? 	400 : (x<10-0.8)   ? 360 : (x<10) 	? 	400 : 400

y5(x) = \
(x<0.16) 	? 	480 : (x<0.16+0.8)   	? 	460 : (x<5-0.8)   ? 360 : (x<5) 	? 	460 : \
(x<5.16) 	? 	480 : (x<5.16+0.8)   	? 	460 : (x<10-0.8)   ? 360 : (x<10) 	? 	460 : 460

plot \
y1(x) ls 1 axis x1y1 title "CPU" with linespoints, \
y2(x) ls 2 axis x1y1 title "GPU(1)" with linespoints, \
y2b(x) ls 3 axis x1y1 title "GPU(2)" with linespoints, \
y3(x) ls 4 axis x1y1 title "RS(1)" with linespoints, \
y4(x) ls 5 axis x1y1 title "RS(2)" with linespoints, \
y5(x) ls 6 axis x1y1 title "RS(3)" with linespoints
