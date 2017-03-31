function [ basis ] = create_mat_dct()
%create_mat_dct outputs the 8-point 2D-DCT basis function

N = 8;
basis = zeros(N, N);
r = 0;

for i = 0:7
    for j = 0:7
        if i == 0
            r = sqrt(1/N);
        else
            r = sqrt(2/N);
        end
        basis(i+1, j+1) = r * cos((pi*(2*j+1)*i)/(2*N));
    end
end

%dc = dctmtx(8);
%A = basis;
%B = dc;
%thr = 0.0000000000000001;
%assert(all(A(:) == B(:)), 'Some elements are not the same'); 
%assert(all(abs(A(:) - B(:)) < thr), 'Some elements are not close');  

end

