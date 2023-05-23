function R = PyramidTextureFilter(I, sigma_s, sigma_r, nlev, scale)

if ~exist('sigma_s','var')
    sigma_s = 5;
end

if ~exist('sigma_r','var')
    sigma_r = 0.05;
end

if ~exist('nlev','var')
    nlev = 11;
end

if ~exist('scale','var')
    scale = 0.8;
end

[G,L]=pyramid(I, nlev, scale);

R=G{size(G,1)};
for l=size(G,1)-1:-1:1
    adaptive_sigma_s = sigma_s*power(scale,l-1);
    w1 = ceil(adaptive_sigma_s*2.0+1); % w1 = 3;
    w2 = ceil(adaptive_sigma_s*2.0+1);

    % upsample
    R_up = imresize(R,[size(G{l},1),size(G{l},2)], 'bilinear');
    R_hat = bilateralFilter(R_up,G{l},w1,adaptive_sigma_s,sigma_r);

    % laplacian
    R_lap = R_hat+L{l};
    R_out = bilateralFilter(R_lap,R_hat,w2,adaptive_sigma_s,sigma_r);

    % enhancement
    R_refine = bilateralFilter(R_out,R_out,w2,adaptive_sigma_s,sigma_r);

    R=R_refine;
end



