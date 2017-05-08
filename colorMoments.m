function colorMoments = colorMoments(image)
% input: image to be analyzed and extract 2 first moments from each R,G,B
% output: 1x6 vector containing the 2 first color momenst from each R,G,B
% channel
% extract color channels
% image = imread('pic.jpg');
R = double(image(:, :, 1));
G = double(image(:, :, 2));
B = double(image(:, :, 3));
% compute 2 first color moments from each channel
meanR = mean( R(:) );
stdR  = std( R(:) );
meanG = mean( G(:) );
stdG  = std( G(:) );
meanB = mean( B(:) );
stdB  = std( B(:) );
skewR = skewness(R(:));
skewB = skewness(B(:));
skewG = skewness(G(:));
% formR2 = (R-meanR).^2;
% stdR2 =  sqrt(sum(formR2(:))./length(R));
% form1R = (R-meanR).^3;
% form1G = (G-meanG).^3;
% form1B = (B-meanB).^3;
% skewR = (sum(form1R(:))./length(R)).^1/3;
% skewG = (sum(form1G(:))./length(G)).^(1/3);
% skewB = (sum(form1B(:))./length(B)).^(1/3);
% construct output vector
colorMoments = [meanR stdR skewR meanG stdG skewG meanB stdB skewG];
% clear workspace
end