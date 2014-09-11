reset
set term postscript eps enhanced color
#set term pngcairo dashed
set output "fig_power.eps"
set size 0.6, 0.6
set xtics 5
set samples 10000
set xlabel "Run-time (s)"
set ylabel "Power (W)"
set xrange [0:10]
set yrange [0:700]
set style func linespoints
set style line 1 lw 2 lt 1 pt 0 lc rgb 'red' 
set style line 2 lw 4 lt 2 pt 0 lc rgb '#006700'
set style line 3 lw 3 lt 3 pt 0 lc rgb '#006700'
set style line 4 lw 3 lt 2 pt 0 lc rgb 'blue'
set style line 5 lw 3 lt 1 pt 0 lc rgb 'blue'
set style line 6 lw 3 lt 9 pt 0 lc rgb 'blue'

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
(x<0.8) 	? 	110 : (x<0.8+0.569)   	? 	145 : (x<0.8+0.569+0.8)   ? 110 : (x<5) 	? 	95 : \
(x<5.8) 	? 	110 : (x<5.8+0.285)   	? 	145 : (x<5.8+0.285+0.8)   ? 110 : (x<10) 	? 	95 : 110

y4(x) = \
(x<0.8) 	? 	400 : (x<0.8+0.2150)   	? 	420 : (x<0.8+0.2150+0.8)   ? 400 : (x<5) 	? 	360 : \
(x<5.8) 	? 	400 : (x<5.8+0.2150)   	? 	420 : (x<5.8+0.2150+0.8)   ? 400 : (x<10) 	? 	360 : 400

y5(x) = \
(x<0.8) 	? 	460 : (x<0.8+0.160)   	? 	480 : (x<0.8+0.160+0.8)   ? 460 : (x<5) 	? 	360 : \
(x<5.8) 	? 	460 : (x<5.8+0.160)   	? 	480 : (x<5.8+0.160+0.8)   ? 460 : (x<10) 	? 	360 : 460

plot \
y1(x) ls 1 axis x1y1 title "CPU" with linespoints, \
y2(x) ls 2 axis x1y1 title "GPU" with linespoints, \
y3(x) ls 4 axis x1y1 title "This work" with linespoints
