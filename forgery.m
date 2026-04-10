clc; clear; close all;

%% STEP 1: READ IMAGE
[filename, pathname] = uigetfile({'*.jpg;*.png;*.jpeg'});
if isequal(filename,0), return; end
img = imread(fullfile(pathname, filename));
[m, n, ch] = size(img);
img_gray = double(rgb2gray(img));

%% STEP 2: FORENSIC CALCULATIONS
% STAGE 2A: ELA
tempFile = 'temp_resave.jpg';
imwrite(img, tempFile, 'jpg', 'Quality', 90);
recompressed = imread(tempFile);
delete(tempFile);
ela_diff = rgb2gray(imabsdiff(img, recompressed));
ela_boosted = im2double(imadjust(ela_diff)); 

% STAGE 2B: GRADIENT FLOW
[Gmag, ~] = imgradient(img_gray);
grad_norm = mat2gray(Gmag);

% STAGE 2C: NOISE EXTRACTION
h = [1 -2 1; -2 4 -2; 1 -2 1]; 
noise_map = mat2gray(abs(filter2(h, double(img_gray))));

% INTERNAL LOGIC FOR DETECTION
combined_score = imgaussfilt((0.5 * ela_boosted) + (0.2 * noise_map) + (0.3 * grad_norm), 2);
threshold = mean(combined_score(:)) + 2.0 * std(combined_score(:));
mask = imfill(imclose(bwareaopen(combined_score > threshold, 150), strel('disk', 15)), 'holes');

% FINAL REFINEMENT
stats = regionprops(mask, 'Area', 'PixelIdxList', 'Solidity');
final_mask = false(m, n);
for i = 1:length(stats)
    if stats(i).Area > (m*n*0.002) && stats(i).Area < (m*n*0.6) && stats(i).Solidity > 0.3
        final_mask(stats(i).PixelIdxList) = true;
    end
end

%% STEP 3: VERDICT CALCULATION
if any(final_mask(:))
    z_score = (mean(combined_score(final_mask)) - mean(combined_score(:))) / std(combined_score(:));
    conf_score = min(100, max(0, (z_score / 6) * 100));
    if conf_score > 70, susp = 'EXTREME'; col = [0.8 0 0]; % Darker red for white background
    elseif conf_score > 40, susp = 'HIGH'; col = [0.9 0.4 0];
    else, susp = 'LOW'; col = [0.5 0.5 0]; end
    status_text = sprintf('TAMPERED (%s SUSPICION)', susp);
else
    conf_score = 0; status_text = 'AUTHENTIC'; col = [0 0.5 0]; % Darker green
end

%% STEP 4: STAGED VISUAL LAYOUT (WHITE BACKGROUND)
fig = figure('Name', 'Image Forensics Pipeline', 'NumberTitle', 'off', 'Color', [1 1 1]);
set(gcf, 'Units', 'Normalized', 'Position', [0.1 0.05 0.8 0.85]);

% --- ROW 1: STAGE 1 ---
annotation('textbox', [0.1 0.91 0.8 0.04], 'String', 'STAGE 1: INPUT IMAGE', ...
    'Color', 'black', 'EdgeColor', 'none', 'HorizontalAlignment', 'center', ...
    'FontSize', 11, 'FontWeight', 'bold');

subplot(3,3,2); imshow(img); 

% --- ROW 2: STAGE 2 ---
annotation('textbox', [0.1 0.64 0.8 0.04], 'String', 'STAGE 2: FORENSIC EXTRACTION TECHNIQUES', ...
    'Color', 'black', 'EdgeColor', 'none', 'HorizontalAlignment', 'center', ...
    'FontSize', 11, 'FontWeight', 'bold');

ax_ela = subplot(3,3,4); imshow(ela_boosted, []); colormap(ax_ela, 'jet');
title('ELA(Error Level Analysis)', 'FontSize', 10, 'Color', 'black');

ax_grad = subplot(3,3,5); imshow(grad_norm, []); colormap(ax_grad, 'parula');
title('Gradient Flow', 'FontSize', 10, 'Color', 'black');

ax_noise = subplot(3,3,6); imshow(noise_map, []); colormap(ax_noise, 'bone');
title('Noise Extraction', 'FontSize', 10, 'Color', 'black');

% --- ROW 3: STAGE 3 ---
annotation('textbox', [0.1 0.34 0.8 0.04], 'String', 'STAGE 3: FINAL RESULTS', ...
    'Color', 'black', 'EdgeColor', 'none', 'HorizontalAlignment', 'center', ...
    'FontSize', 11, 'FontWeight', 'bold');

% Plot 1: Detection Mask (Ordered first)
subplot(3,3,7); imshow(final_mask); 
title('Detection Mask', 'FontSize', 10, 'Color', 'black');

% Plot 2: Detected Anomalies (Ordered second)
subplot(3,3,8:9); imshow(img); hold on;
if any(final_mask(:))
    B = bwboundaries(final_mask);
    for k = 1:length(B), plot(B{k}(:,2), B{k}(:,1), 'r', 'LineWidth', 2); end
end
title('Detected Anomalies', 'FontSize', 10, 'Color', 'black');

% --- FINAL VERDICT FOOTER ---
verdict_str = {['FINAL VERDICT: ' status_text], ...
               ['CONFIDENCE LEVEL: ' num2str(conf_score, '%.1f') '%']};

annotation('textbox', [0.1, 0.02, 0.8, 0.07], 'String', verdict_str, ...
    'Color', col, 'FontSize', 14, 'FontWeight', 'bold', 'EdgeColor', col, ...
    'LineWidth', 1.5, 'BackgroundColor', [0.95 0.95 0.95], ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');