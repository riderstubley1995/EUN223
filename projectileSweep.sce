//sweeps across a range of 15-75 degrees launch at 10m/s
colours = ["r","g","b","c","m","y","k"];
realtimeinit(2);
for i=1.5:1:7.5

        projectileMotion(10,10*i,colours(i));
        sleep(1500);
    
end
