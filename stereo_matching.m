function [output] = stereo_matching(input1, input2)
    tic;
    neighbor_size = 2; % (2x+1)*(2x+1) pixels total
    
    input_rgb_left = imread(input1, 'jpg');
    input_rgb_right = imread(input2, 'jpg');
    input_left = rgb2gray(input_rgb_left);
    input_right = rgb2gray(input_rgb_right);
    input_left = im2double(input_left);
    input_right = im2double(input_right);
    [left_height, left_width] = size(input_left);
    [right_height, right_width] = size(input_right);
    
    corresponding_point = zeros(left_height, left_width);
    depth = zeros(left_height, left_width);
    [max_disparity, min_disparity] = harris_code_and_RANSAC(input_left, input_right);
    for i = 1:left_height
        for j = 1:left_width
            [row_range_from, rwo_range_to, col_range_from, col_range_to, len_left] = descriptor_range(i, j, left_height, left_width, neighbor_size);
            descriptor_left = reshape(input_left(row_range_from:rwo_range_to, col_range_from:col_range_to), 1, len_left);
            similarity = [];
            for k = max(1, j + min_disparity):min(right_width, j + max_disparity)
                [row_range_from, rwo_range_to, col_range_from, col_range_to, len_right] = descriptor_range(i, k, right_height, right_width, neighbor_size);
                if len_left == len_right
                    descriptor_right = reshape(input_right(row_range_from:rwo_range_to, col_range_from:col_range_to), 1, len_right);
                    similarity = [similarity; compare_similarity(descriptor_left, descriptor_right, 'nor_cor') k];
                end
            end
            [val, index] = max(similarity(:,1));%max if nor_cor, min if ssd 
            corresponding_point(i, j) = similarity(index, 2); %corresponding point = (i, index)
            depth(i, j) = (abs(j - corresponding_point(i, j)))/max_disparity;
        end
    end
    scaled_depth = (depth-min(depth(:))) ./ (max(depth(:)-min(depth(:))));
    imshow(scaled_depth);
    toc;
    
end