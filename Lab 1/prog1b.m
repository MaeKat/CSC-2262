%Vanessa Hoffmann
%cs2262
%prog1b


h = 70;
d = 5500;
g = 9.81;
stepsize = 30;
for u = 240: stepsize: 390
f = @(theta) u*cos(theta)*((u*sin(theta)/g) + sqrt((u^2*sin(theta)^2/(g^2)) - (2*h/g)))-d;
    for grid_point = 0: 1 * pi/180: 90*pi/180
        left_end_point = grid_point;
        right_end_point = grid_point +  1 * pi/180;
        function_left = f(left_end_point);
        function_right = f(right_end_point);
        if(function_left * function_right < 0)
            guess = (left_end_point + right_end_point)/2;
            theta = fzero(f,guess);
            fprintf('u = %3.0f   theta = %9.5f\n',u,theta*180/pi);
        end  
    end
    fprintf('\n');
end