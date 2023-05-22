% BILATERALFILTER Two dimensional bilateral filtering.
%
%    This function implements 2-D bilateral filtering using the method
%    outlined in:
%
%        C. Tomasi and R. Manduchi. Bilateral Filtering for Gray and Color
%        Images. In Proceedings of the IEEE International Conference on
%        Computer Vision, 1998. 
%
%    B = bfilter2(A, W, SIGMA_S, SIGMA_R) performs 2-D bilateral filtering
%    for color image A. A should be a double precision matrix with
%    normalized values in the closed interval [0,1]. The half-size of the
%    Gaussian bilateral filter window is defined by W. The spatial-domain
%    standard deviation is given by SIGMA_S and the range-domain standard
%    deviation is given by SIGMA_R.
%
% JiaXian Yao, UC Berkeley, November 2016 (modified based on Douglas R.
% Lanman, Brown University, September 2006).

function B = bilateralFilter(A, G, w, sigma_s, sigma_r)
    
    % Pre-compute the Gaussian spatial kernel
    Gs = fspecial('gaussian', 2 * w + 1, sigma_s);

    % Parameters
    dimX = size(A, 1); % dimension of A in x
    dimY = size(A, 2); % dimension of A in y
    c = size(A, 3); % number of color channels of A
    
    % Initialize the image
    B = zeros(size(A));
    
    parfor i = 1 : dimX
        for j = 1 : dimY
            
            % Extract the local patch
            minX = max(i-w, 1);
            maxX = min(i+w, dimX);
            minY = max(j-w, 1);
            maxY = min(j+w, dimY);
            PA = A(minX:maxX, minY:maxY, :);
            PG = G(minX:maxX, minY:maxY, :);
            
            % Compute the Gaussian range kernel
            dR = PG(:, :, 1) - G(i, j, 1);
            dG = PG(:, :, 2) - G(i, j, 2);
            dB = PG(:, :, 3) - G(i, j, 3);
            Gr = exp(-(dR.^2+dG.^2+dB.^2)/(2 * sigma_r^2));
            
            % Compute the bilateral filter response
            F = Gr .* Gs((minX:maxX)-i+w+1,(minY:maxY)-j+w+1);
            normF = sum(F(:));
%             for k = 1 : c
%                 B(i, j, k) = sum(sum(PA(:, :, k) .* F)) / normF;
%             end
            B(i, j, :) = sum(sum(PA(:, :, :) .* F)) / normF;
            
        end
    end
    

end