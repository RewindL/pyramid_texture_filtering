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