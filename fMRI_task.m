%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fMRI EXPERIMENTAL TASK
%
% some documentation here 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CLEANUP & SET MODES

% Clean up the environment
clc; % Clear the Command Window.
close all; % Close all figures (except those of imtool.)
clear; % Clear all variables from the workspace.

% Decide on the debug and PC mode
debug = true; % Debug mode flag. Set to false for actual experiment runs.
fmriPC = false; % Computer mode flag. Set to true whenrunning on the fMRI scanner computer.

%% CHECK AND SET WORKING DIRECTORY

% Declare default directories for the source and utilities
default_utils_dir = './utils';
default_src_dir = './src';

% Check if the default utility directory exists
while ~exist(default_utils_dir, 'dir')
    disp(['Utility directory "', default_utils_dir, '" does not exist.']);
    % Prompt the user to input the utility directory
    utils_dir = input('Please provide the path to the utility directory: ', 's');
    default_utils_dir = utils_dir;
end

% Check if the default source directory exists
while ~exist(default_src_dir, 'dir')
    disp(['Source directory "', default_src_dir, '" does not exist.']);
    % Prompt the user to input the source directory
    src_dir = input('Please provide the path to the source directory: ', 's');
    default_src_dir = src_dir;
end

% Add both directories to the MATLAB path once we're sure they exist
addpath({default_utils_dir, default_src_dir});
disp('Directories have been added to the MATLAB path.');

%% IMPORT EXTERNAL PARAMETERS & INITIALISE PTB

% Use the parse parameter function to import all parameters from file
params = parseParameterFile('parameters.txt');

% Initialise psychtoolbox (PTB)
initialisePTB();

%% BEGIN THE EXPERIMENT

% Ensure that the screen gets closed when the script terminates.
cleanObj = onCleanup(@()sca);





























