clc;
clear;

fprintf('Created by Gin\n')
fprintf('GPA Caculator for NJU Student\n');
fprintf('Just for fun and convenience. Actually it is a very foolish and ugly pro.\n');
fprintf('You can see the results in the result.txt\n');

data = xlsread('.\GPA');
result = fopen('.\result.txt', 'w+');

unitsColumn = 6;
gradesColumn = 7;

units = data(:, unitsColumn);
grades = data(:, gradesColumn);
[height, width] = size(data);

% standard 4.0
cndGPAs = zeros(height, 1);
% convert
for i = 1: height
    if grades(i) >= 90
        cndGPAs(i) = 4;
    elseif grades(i) >= 80
        cndGPAs(i) = 3; 
    elseif grades(i) >= 70
        cndGPAs(i) = 2; 
    elseif grades(i) >= 60
        cndGPAs(i) = 1;
    else
        cndGPAs(i) = 0;
    end 
end
cndGPAMultiplyUnit = cndGPAs .* units;
cndGPA = sum(cndGPAMultiplyUnit) / sum(units);

fprintf(result, 'Standard 4.0 GPA is %8.7f\r\n', cndGPA);

% improved 4.0(1)
cndGPAs = zeros(height, 1);
% convert
for i = 1: height
    if grades(i) >= 85
        cndGPAs(i) = 4;
    elseif grades(i) >= 70
        cndGPAs(i) = 3; 
    elseif grades(i) >= 60
        cndGPAs(i) = 2; 
    else
        cndGPAs(i) = 0; 
    end 
end
cndGPAMultiplyUnit = cndGPAs .* units;
cndGPA = sum(cndGPAMultiplyUnit) / sum(units);

fprintf(result, 'improved 4.0(1) GPA is %8.7f\r\n', cndGPA);

% improved 4.0(2)
cndGPAs = zeros(height, 1);
% convert
for i = 1: height
    if grades(i) >= 85
        cndGPAs(i) = 4;
    elseif grades(i) >= 75
        cndGPAs(i) = 3; 
    elseif grades(i) >= 60
        cndGPAs(i) = 2; 
    else
        cndGPAs(i) = 0; 
    end 
end
cndGPAMultiplyUnit = cndGPAs .* units;
cndGPA = sum(cndGPAMultiplyUnit) / sum(units);

fprintf(result, 'improved 4.0(2) GPA is %8.7f\r\n', cndGPA);

% PeiKing 4.0
cndGPAs = zeros(height, 1);
% convert
for i = 1: height
    if grades(i) >= 90
        cndGPAs(i) = 4;
    elseif grades(i) >= 85
        cndGPAs(i) = 3.7; 
    elseif grades(i) >= 82
        cndGPAs(i) = 3.3; 
    elseif grades(i) >= 78
        cndGPAs(i) = 3; 
    elseif grades(i) >= 75
        cndGPAs(i) = 2.7;
    elseif grades(i) >= 72
        cndGPAs(i) = 2.3; 
    elseif grades(i) >= 68
        cndGPAs(i) = 2; 
    elseif grades(i) >= 64
        cndGPAs(i) = 1.5;
    elseif grades(i) >= 60
        cndGPAs(i) = 1;
    else
        cndGPAs(i) = 0; 
    end 
end
cndGPAMultiplyUnit = cndGPAs .* units;
cndGPA = sum(cndGPAMultiplyUnit) / sum(units);

fprintf(result, 'PeiKing GPA is %8.7f\r\n', cndGPA);

% Canada 4.3
cndGPAs = zeros(height, 1);
% convert
for i = 1: height
    if grades(i) >= 90
        cndGPAs(i) = 4.3;
    elseif grades(i) >= 85
        cndGPAs(i) = 4; 
    elseif grades(i) >= 80
        cndGPAs(i) = 3.7; 
    elseif grades(i) >= 75
        cndGPAs(i) = 3.3; 
    elseif grades(i) >= 70
        cndGPAs(i) = 3;
    elseif grades(i) >= 65
        cndGPAs(i) = 2.7; 
    elseif grades(i) >= 60
        cndGPAs(i) = 2.3; 
    else
        cndGPAs(i) = 0; 
    end 
end
cndGPAMultiplyUnit = cndGPAs .* units;
cndGPA = sum(cndGPAMultiplyUnit) / sum(units);

fprintf(result, 'Canada GPA is %8.7f\r\n', cndGPA);
