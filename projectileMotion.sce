function[] = projectileMotion(initial, theta, col) //Takes initial velocity and 
                                              //launch angle of projectile
                                              //and colour
                                              
    clear x1;
    clear y1;
    scf(1);
    v0 = initial;            //Initial velocity  in m/s
    a= theta;            //Angle of projection(in degrees)
    h= 0.05;          //Time step (in seconds)
    g=9.8;          //acceleration due to gravity in m/s^2
    xmax=v0^2*sind(2*a)/g;
    ymax=v0^2*sind(a)^2/(2*g);
    td=2*v0*sind(a)/g;           //total time

    colour(1)=col;
    colour(2)="."
    x1(1)=0;
    y1(1)=0;
    i=2;
    plot(x1,y1,strcat(colour()));
    title("Simple Projectile Motion of a ball"); //Label the graph with title,
    xlabel("Distance (m)");                      //X-axis and
    ylabel("Height (m)");                        //Y-axis
    realtimeinit(h);
    for t=0:h:td
        
        x1(i)=x1(i-1)+h*v0*cosd(a);      //Euler's method for x
        y1(i)=y1(i-1)+h*(v0*sind(a)-g*t);//Euler's method for y
        i=i+1; //Increment the array count by 1
        realtime(i);
        plot(x1,y1,strcat(colour()));
    end

endfunction
