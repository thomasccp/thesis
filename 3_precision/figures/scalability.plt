reset
set term postscript eps enhanced color
set output "fig_scalability.eps"
set size 0.7, 0.7
set xlabel "Number of points N_P (k)"
set xrange [0.05:12]
set logscale y
set ylabel "Computation time T_{comp} (ms)"
set yrange [0.0001:500]
set format y "%.0s"
set key bottom right
set style line 1 lt 2 lw 2 pt 2 ps 1 pi 5 lc rgb "#FF0000"
set style line 2 lt 3 lw 2 pt 3 ps 1 pi 5 lc rgb "#FF0000"
set style line 3 lt 4 lw 2 pt 4 ps 1 pi 5 lc rgb "#FF0000"
set style line 4 lt 5 lw 2 pt 5 ps 1 pi 5 lc rgb "#FF0000"
set style line 5 lt 6 lw 2 pt 6 ps 1 pi 5 lc rgb "#006400"
set style line 6 lt 7 lw 2 pt 7 ps 1 pi 5 lc rgb "#006400"
set style line 7 lt 8 lw 2 pt 8 ps 1 pi 5 lc rgb "#0000FF"
set style line 8 lt 9 lw 2 pt 9 ps 1 pi 5 lc rgb "#0000FF"
set style line 9 lt 10 lw 2 pt 10 ps 1 pi 5 lc rgb "#0000FF"
set style line 10 lt 11 lw 2 pt 11 ps 1 pi 5 lc rgb "#0000FF"
set style line 11 lt 1 lw 2 pt 3 ps 1 pi 5 lc rgb "#000000"

c1(x) = 0.009471291*5*x*1000
c2(x) = 0.004762206*5*x*1000;
c4(x) = 0.002481083*5*x*1000;
c6(x) = 0.001762156*5*x*1000;
c8(x) = 0.001253514*5*x*1000;
c10(x) = 0.001148406*5*x*1000;
c12(x) = 0.001154772*5*x*1000;
g1(x) = 0.00093985*x*1000;
g4(x) = 0.000234962*x*1000;
f1a(x) = 0.00125*x*1000;
f1b(x) = 0.000396276*x*1000;
f4a(x) = 0.0003125*x*1000;
f4b(x) = 0.000099069*x*1000;
y(x) = 1;

plot 	c1(x) 	ls 1 	title "1-C CPU" with lp,\
		c4(x) 	ls 2 	title "4-C CPU" with lp, \
		c8(x) 	ls 3 	title "8-C CPU" with lp, \
		c12(x) 	ls 4 	title "12-C CPU" with lp, \
		g1(x) 	ls 5 	title "1 GPU" with lp, \
		g4(x) 	ls 6 	title "4 GPUs" with lp, \
		f1a(x) 	ls 7 	title "1 FPGAs" with lp, \
		f1b(x) 	ls 8 	title "1 FPGAs and 12-C CPU" with lp, \
		f4a(x) 	ls 9 	title "4 FPGAs" with lp, \
		f4b(x) 	ls 10 	title "4 FPGAs and 12-C CPU" with lp, \
		y(x) 	ls 11 	title "Real-time bound"
