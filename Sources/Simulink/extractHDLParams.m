function params = extractHDLParams(d_obj)
    [B, A, g] = ctf(d_obj);
    
    % Numerator is already [1 x 3]
    params.Num = B; 
    
    % Force Denominator to be [1.0, a1, 0.0] to guarantee 1st-order compatibility
    % where a0 = 1.0, a1 = designed pole, a2 = 0.0
    params.Den = A; 
    
    % Scale values vector
    params.g   = g;
end