% run_lge_example.m
% -----------------
% Example script to demonstrate the Hakimi_LGE_Function.
% This script loads a sample time series, runs the LGE forecast,
% and plots the results for visual comparison.

clear; clc; close all;

% --- 1. Load Data ---
% Load the sample time-series data from the CSV file.
if exist('sample_data.csv', 'file')
    fprintf('Loading sample data from sample_data.csv...\n');
    TimeSeries = readmatrix('sample_data.csv');
else
    error('File sample_data.csv not found. Please ensure it is in the same directory.');
end

% --- 2. Run LGE Forecast ---
% Call the LGE function to get predictions and corresponding true values.
fprintf('Running Local Geometric Extrapolation...\n');
[TrueValues, LGE_Predictions] = Hakimi_LGE_Function(TimeSeries);

% --- 3. Display Results ---
% Print a few results to the console.
fprintf('Forecast complete. Showing first 10 results:\n');
fprintf('----------------------------------------\n');
fprintf('Time | True Value | LGE Prediction\n');
fprintf('----------------------------------------\n');
for i = 1:min(10, length(TrueValues))
    fprintf('%4d | %10.4f | %14.4f\n', i+2, TrueValues(i), LGE_Predictions(i));
end
fprintf('----------------------------------------\n');

% --- 4. Plot Results ---
% Create a plot to visually compare the LGE predictions with the true values.
fprintf('Generating plot...\n');
figure;
plot(TrueValues, 'b-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
hold on;
plot(LGE_Predictions, 'r--s', 'LineWidth', 1.5);
hold off;

title('LGE Forecast vs. True Values');
xlabel('Time Step (t)');
ylabel('Value');
legend('True Values', 'LGE Predictions', 'Location', 'best');
grid on;
set(gca, 'FontSize', 12);

fprintf('Example run finished.\n');
