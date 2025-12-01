function [ TrueValues, LGE_Predictions ] = Hakimi_LGE_Function ( TimeSeries )
% Hakimi_LGE_Function
% -------------------
% Implements the Local Geometric Extrapolation (LGE) forecasting method.
%
% INPUT:
%   TimeSeries         : Numeric vector representing a univariate time series,
%                        ordered chronologically.
%
% OUTPUT:
%   TrueValues         : Actual observed values at each forecast target step.
%   LGE_Predictions    : One-step-ahead predictions computed using LGE.
%
% The LGE method assumes that the most recent geometric growth factor
% (ratio between consecutive observations) will persist into the next step.
% It uses only the two most recent observed values at any time t to predict
% the value at time t+1, requiring no parameters, training, or historical depth.
%
% Author: Alireza Hakimi
% MATLAB R2024a

% Loop through the series, stopping two steps before the end
for t = 1 : length(TimeSeries) - 2

    % Previous observed value at time t
    Prev_Observation = TimeSeries(t);

    % Current observed value at time t+1
    Current_Observation = TimeSeries(t+1);

    % The true (actual) target value at time t+2 for comparison/evaluation
    TrueValues(t) = TimeSeries(t+2);

    % Compute local geometric growth factor between current and previous observations
    Local_GrowthFactor = Current_Observation / Prev_Observation;

    % Forecast for time t+2 using the growth factor applied to current observation
    LGE_Predictions(t) = Current_Observation * Local_GrowthFactor;

end

end
