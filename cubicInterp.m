function [tpoints, interpData] = cubicInterp(s, t)

tpoints = t(1):1/t(end):t(end);
interpData = spline(t, s, tpoints);

end