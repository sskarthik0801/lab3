function w_hat_theta = ECE569_MatrixLog3(R)
% This function implements the matrix log function
% for a 3x3 rotation matrix R using
% Algorithm: (MR eqn. 3.58)
%
% Input: R = expm(w_hat*theta); 3x3 rotation matrix
% Returns: w_hat*theta = logm(R) is the exponential coordinate
% represented as a skew-symmetric 3x3 matrix.
% If tr(R) = 1, then the axis is not defined
% so we just return all zeros.

if ismembertol(trace(R), 3)
    % case (a) R = I
    w_hat_theta = zeros(3);

elseif ismembertol(trace(R), -1)
    % case (b) θ = π
    theta = pi;

    % Handle subcases based on diagonal elements to avoid division by zero
    if ~ismembertol(R(3,3), -1)
        w = (1/sqrt(2*(1+R(3,3)))) * [R(1,3); R(2,3); 1+R(3,3)];
    elseif ~ismembertol(R(2,2), -1)
        w = (1/sqrt(2*(1+R(2,2)))) * [R(1,2); 1+R(2,2); R(3,2)];
    else
        w = (1/sqrt(2*(1+R(1,1)))) * [1+R(1,1); R(2,1); R(3,1)];
    end

    w_hat_theta = ECE569_VecToso3(w * theta);

else
    % case (c) General case
    theta = acos((trace(R) - 1) / 2);
    w_hat = (1 / (2 * sin(theta))) * (R - R');
    w_hat_theta = w_hat * theta;
end
end