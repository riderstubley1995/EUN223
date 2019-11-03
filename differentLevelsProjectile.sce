function[] = differentLevelsProjectile(velocity,angle,initialheight,finalheight)
    //takes launch velocity, launch angle, initial height and final height
    //clears the plotting arrays
    clear x1;
    clear y1;
    //sets up the graph
    scf(1);
    title("Projectile Motion of a ball across levels"); //Label the graph with title,
    xlabel("Distance (m)");                      //X-axis and
    ylabel("Height (m)");                        //Y-axis
    h1 = initialheight;
    h2 = finalheight;
    theta = angle;
    v = velocity;
    s = h2 - h1;
    vy = v*sind(theta);
    vx = v*cosd(theta);
    g=9.8;
    td = ((-vy)-sqrt(vy^2 -4*-4.9*-s))/(2*-4.9);
    //computes the max distance to draw the second level
    xmax=td*vx + 5;
    //in every case, the scenario where we check the subtract condition
    //of the quadratic formula yeilds the correct time
    t1 = ((-vy)+sqrt(vy^2 -4*-4.9*-s))/(2*-4.9); 
    
    h= 0.05;
    x1(1)=0;
    y1(1)=h1;
    //draws the two levels
    counter = 1;
    for step = 0:0.5:xmax/2
        levelx(counter)=step;
        plot(levelx(counter),h1,"r*");
        counter = counter+1;

    end

    counter = 1;
    for step = (xmax/2):0.1:((xmax/2)+1)
        newlevelx(counter)=step;
        plot(newlevelx(counter), h1 + s*0.1*counter , "r*");
        counter = counter +1;
    end

    counter = 1;
    for step = ((xmax/2)+1):0.5:xmax
        finallevelx(counter)=step;
        plot(finallevelx(counter),h2,"r*");
        counter = counter+1;

    end

    realtimeinit(h);
    sleep(3000);
    i=2;
    for t=0:h:td
        x1(i)=x1(i-1)+h*vx;      //Euler's method for x
        y1(i)=y1(i-1)+h*(vy-g*t);//Euler's method for y
        i=i+1; //Increment the array count by 1
        realtime(i);
        plot(x1,y1,"o");
    end
endfunction
