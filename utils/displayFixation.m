function displayFixation(win, winRect, in)
% displayFixation - Draw a fixation cross on the screen.
%
%   displayFixation(win, winRect, params, in) draws a fixation cross on the
%   specified Psychtoolbox window 'win' within the given window rectangle
%   'winRect'. Use this function to write your fixation cross element. It
%   already contains several possibiliies: just comment out any part you
%   don't want to use.
%
%   Hint: when writing your own fixation element: use the black, white, and 
%   gray values from the input parameter.
%
%   Input:
%       - win: Psychtoolbox window pointer.
%       - winRect: Window rectangle defining the coordinates of the window.
%       - params: Structure containing parameters for fixation cross
%                 customization.
%       - in: Structure containing input data, including color values.
%
%   Usage:
%       displayFixation(win, winRect, params, in) draws the fixation cross
%       on the screen using the specified parameters and colors.


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIMPLE BLACK '+' SIGN
% DrawFormattedText(win, '+', 'center', 'center', in.black);
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Andrea's black-white-black circlular target
% 
% % Declare the size of each of the 3 elements of the target: exterior ring,
% % central colour, central point (in visual degrees)
% rectSize = [0.6 0.5 0.1];
% % Convert the element sizes from to pixels
% fixSize = round(convertVisualUnits(rectSize, 'deg', 'px')); 
% 
% % Initialize an array to store rectangle coordinates for drawing the fixation point
% fixRect = zeros(4, length(fixSize));
% 
% % For each dimension specified in fixSize, calculate the rectangle's coordinates.
% % This loop allows for the creation of a composite fixation symbol, potentially consisting of multiple elements.
% for i = 1:length(fixSize)
%     % Calculate the rectangle for the fixation component.
%     % The CenterRect function creates a rectangle of the specified size, centered within the window.
%     % Dividing FixSize by 2 ensures the dimensions are correctly centered around the fixation point.
%     fixRect(:,i) = CenterRect([0 0 fixSize(i)/2 fixSize(i)/2], winRect); 
% end
% 
% % Define the colors for the fixation point. This matrix specifies colors 
% % for each element of the fixation.
% fixCol = [in.black;  in.white; in.black]';
% 
% % Draw the actual fixation cross
% Screen('FillOval', win, fixCol, fixRect); % Draw the fixation cross


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ELABORATE CROSS
% More elaborate fixation cross made of two intersected rectangles,
% allowing to better control the size of the cross

% Decide on the colour of the fixation cross
fixCol = in.black;

% Decide the visual degree size of the cross (size of the square)
fixSize = 0.4;

% Define the size and position of the fixation cross (in pixels)
crossLength = round(convertVisualUnits(fixSize, 'deg', 'px')); % Length of each arm of the cross
crossWidth = round(crossLength/10); % Width of the cross lines
centerX = winRect(3) / 2;
centerY = winRect(4) / 2;

% Define the coordinates of the fixation cross
crossCoords = [centerX - crossLength, centerY - crossWidth / 2, centerX + crossLength, centerY + crossWidth / 2;...  % Horizontal line
               centerX - crossWidth / 2, centerY - crossLength, centerX + crossWidth / 2, centerY + crossLength]'; % Vertical line

% Draw the actual fixation cross
Screen('FillRect', win, fixCol, crossCoords); % Draw the fixation cross

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end