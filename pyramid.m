function [G_pyr, L_pyr] = pyramid(I,nlev,scale,sigma)

r = size(I,1);
c = size(I,2);
if ~exist('nlev','var')
    nlev=5;
end
if ~exist('scale','var')
    scale=0.5;
end
if ~exist('sigma','var')
    sigma=1.0;
end

% recursively build pyramid
G_pyr = cell(nlev,1);
L_pyr = cell(nlev-1,1);
filter = fspecial('gaussian', 5, sigma);

G_pyr{1} = I;

for l = 1:nlev - 1
%     sig = max(sigma*scale^(l-1), 0.5);
%     filter = fspecial('gaussian', max(2*round(2*sig)+1, 5), sig);
    I_down = downsample(I,filter,scale);
    L_pyr{l} = I - upsample(I_down,filter,I);
    G_pyr{l+1} = I_down;
    
    I = I_down;
end

  
function O = downsample(I, filter, s)
r = size(I,1);
c = size(I,2);

O = imfilter(I,filter,'symmetric');        
O = imresize(O,[floor(r*s),floor(c*s)], 'bilinear');

function O = upsample(I, filter, Ref)
r = size(Ref,1);
c = size(Ref,2);

O = imresize(I,[r,c], 'bilinear');
O = imfilter(O,filter,'symmetric');        


