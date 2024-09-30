function output = mybilateralfilter(inputImage, sigma_s, sigma_r)
    
    % Converting the image to double
    inputImage = double(inputImage);

    % Taking the size of image
    [rows, cols] = size(inputImage);

    % Defining the size of the filter according to sigma_s since it is a
    % spacial factor
     filter_bounds = ceil(3 * sigma_s);
    [X, Y] = meshgrid(-filter_bounds:filter_bounds, -filter_bounds:filter_bounds);
    
    % Creation of the spatial Gaussian filter
    spatial_weight = exp(-(X.^2 + Y.^2) / (2 * sigma_s^2));
    
    % Initialising the output image
    output = zeros(rows, cols);
    
    % Applying the bilateral filter using two loops for pixel traversal of
    % input image
    for i = 1:rows
        for j = 1:cols
            % Extract a intensity patch around the pixel (i, j) and making sure
            % of the dimensions not being out of bounds
            i_1 = max(i - filter_bounds, 1);
            i_2 = min(i + filter_bounds, rows);
            j_1 = max(j - filter_bounds, 1);
            j_2 = min(j + filter_bounds, cols);
            
            % Getting the intensity patch for intensities and corresponding spatial weights
            intensity_patch = inputImage(i_1:i_2, j_1:j_2);
            spatial_patch = spatial_weight((i_1:i_2) - i + filter_bounds + 1, (j_1:j_2) - j + filter_bounds + 1);
            
            % Computing the intensity difference between the center pixel and the patch
            intensity_diff = intensity_patch - inputImage(i, j);
            
            % Creating the weinghts based on intensity differences using
            % gaussian function
            weights = exp(-(intensity_diff.^2) / (2 * sigma_r^2));
            
            % Computing the combined bilateral filter weights
            bilateral_weight = spatial_patch .* weights;
            
            % Normalizing the weights
            normalization_factor = sum(bilateral_weight(:));
            
            % Computing the output pixel value as a weighted sum
            output(i, j) = sum(sum(intensity_patch .* bilateral_weight)) / normalization_factor;
        end
    end
    
    
    output = uint8(output);
end
