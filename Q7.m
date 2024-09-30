
barbara = imread('barbara256.png');
kodak = imread('kodak24.png');




sigma_noise1 = 5;
sigma_noise2 = 10;

% Noise addition to both images
barbara_noisy1 = imnoise(barbara, 'gaussian', 0, (sigma_noise1 / 255)^2);
kodak_noisy1 = imnoise(kodak, 'gaussian', 0, (sigma_noise1 / 255)^2);

barbara_noisy2 = imnoise(barbara, 'gaussian', 0, (sigma_noise2 / 255)^2);
kodak_noisy2 = imnoise(kodak, 'gaussian', 0, (sigma_noise2 / 255)^2);

% Bilateral filter parameters
params = [
    2, 2;  % (sigma_s = 2, sigma_r = 2)
    0.1, 0.1;  % (sigma_s = 0.1, sigma_r = 0.1)
    3, 15  % (sigma_s = 3, sigma_r = 15)
];


for noise_level = 1:2
    if noise_level == 1
        barbara_noisy = barbara_noisy1;
        kodak_noisy = kodak_noisy1;
        noise_sigma = sigma_noise1;
    else
        barbara_noisy = barbara_noisy2;
        kodak_noisy = kodak_noisy2;
        noise_sigma = sigma_noise2;
    end
    
    % Looping for each parameters of bilateral filter
    for param_index = 1:size(params, 1)
        sigma_s = params(param_index, 1);
        sigma_r = params(param_index, 2);
        
       
        barbara_filtered = mybilateralfilter(barbara_noisy, sigma_s, sigma_r);
        kodak_filtered = mybilateralfilter(kodak_noisy, sigma_s, sigma_r);
        
        
        figure;
        subplot(2, 3, 1); imshow(barbara); title('Original Barbara');
        subplot(2, 3, 2); imshow(barbara_noisy); title(['Barbara Noisy (\sigma = ', num2str(noise_sigma), ')']);
        subplot(2, 3, 3); imshow(barbara_filtered); title(['Filtered (\sigma_s = ', num2str(sigma_s), ', \sigma_r = ', num2str(sigma_r), ')']);
        
        subplot(2, 3, 4); imshow(kodak); title('Original Kodak');
        subplot(2, 3, 5); imshow(kodak_noisy); title(['Kodak Noisy (\sigma = ', num2str(noise_sigma), ')']);
        subplot(2, 3, 6); imshow(kodak_filtered); title(['Filtered (\sigma_s = ', num2str(sigma_s), ', \sigma_r = ', num2str(sigma_r), ')']);
        
        
        saveas(gcf, ['bilateral_filter_noise_sigma_', num2str(noise_sigma), '_sigma_s_', num2str(sigma_s), '_sigma_r_', num2str(sigma_r), '.png']);
    end
end
