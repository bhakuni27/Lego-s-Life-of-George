function transformable = canBeTransformed(img)
    % Determine whether the image can be transformed

    % Convert the image to grayscale
    gray_img = rgb2gray(img);

    % Apply the Canny edge detection algorithm to the grayscale image
    edge_img = edge(gray_img,'canny');

    % Morphologically thicken the edges to make them more prominent
    thickened_img = bwmorph(edge_img,'thicken');
    
    % Define the range of angles to use for the Radon transform
    theta_range = -90:89;

    % Perform the Radon transform on the thicken image using the specified
    % theta range
    [R,~] = radon(thickened_img, theta_range);

    % Find the maximum value in each column of the Radon transform
    max_values = max(R);

    % Determine the angle associated with the maximum value in the
    % Radon transform
    angle = 90;
    while(angle > 50 || angle < -50)
        [~, angle] = max(max_values);                           
        max_values(angle) = 0; 
        angle = angle - 91;
    end
    
    % Determine whether the image is transformable based on the angle
    if (angle ~= 0) 
        transformable = true;
    else
        transformable = false;
    end
end