%Vanessa Hoffmann
%cs2262
%prog1b

accuracy = 1e-7;
f = @(x) 728 * x^4 - 8249 * x^3 + 33660 * x^2 - 57996 * x + 34992;
fp = @(x) 2912 * x^3 - 24747 * x^2 + 67320 * x - 57996;
stepsize = 0.1;
for grid_point = 0 : stepsize : 5
    left_end_point = grid_point;
    right_end_point = grid_point + stepsize;
    function_left = f(left_end_point);
    function_right = f(right_end_point);
    if(function_left * function_right < 0)
        guess = (left_end_point + right_end_point)/2;
        x = newton(f, fp, guess, accuracy);
        fprintf('x = %.5f\n', x);
    end 
    if(function_left == 0)
        fprintf('x = %.5f\n' , left_end_point);
    end
end
