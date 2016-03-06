clc;
clear;

fprintf('Created by Gin\n')
fprintf('GPA Caculator for NJU Student\n');
fprintf('The information of GPA is from http://apps.chasedream.com/gpa/\n');
fprintf('\n');
fprintf('Just for fun and convenience. Actually it is a very foolish and ugly pro.\n');
fprintf('\n');
fprintf('介绍：\n');
fprintf('标准4.0：100~90，4.0；89~80，3.0；79~70，2.0；69~60，1.0；59~0，0\n');
fprintf('改进4.0（1）：100~85，4.0；84~70，3.0；69~60，2.0；59~0，0\n');
fprintf('改进4.0（2）：100~85，4.0；84~75，3.0；74~60，2.0；59~0，0\n');
fprintf('北大4.0：100~90，4.0；89~85，3.7；84~82，3.3；81~78，3.0；77～75，2.7；74～72，2.3；71～68，2.0；67～64，1.5；63～60，1.0；59~0，0\n');
fprintf('加拿大4.3：100~90，4.3；89~85，3.0；84～80，3.7；79～75，3.3；74~70，3.0；69～65，2.7；64～60，2.3；59~0，0\n');
fprintf('\n');
fprintf('Instrcution:\n');
fprintf('-->打开GPA.xlsx,将你从教务系统中导出的成绩复制到GPA.xlsx;\n');
fprintf('-->删除前两行，删除之后的学分统计、只有成绩和课程的列表;\n');
fprintf('-->将学分和综合成绩下面的数字属性从文本改成数字;\n');
fprintf('-->然后按回车\n')
fprintf('-->You can see the results in the result.txt.\n');

if(input(''))
end

data = xlsread('.\GPA');
result = fopen('.\result.txt', 'w+');

fprintf(result, '介绍：\r\n');
fprintf(result, '标准4.0：100~90，4.0；89~80，3.0；79~70，2.0；69~60，1.0；59~0，0\r\n');
fprintf(result, '改进4.0（1）：100~85，4.0；84~70，3.0；69~60，2.0；59~0，0\r\n');
fprintf(result, '改进4.0（2）：100~85，4.0；84~75，3.0；74~60，2.0；59~0，0\r\n');
fprintf(result, '北大4.0：100~90，4.0；89~85，3.7；84~82，3.3；81~78，3.0；77～75，2.7；74～72，2.3；71～68，2.0；67～64，1.5；63～60，1.0；59~0，0\r\n');
fprintf(result, '加拿大4.3：100~90，4.3；89~85，3.0；84～80，3.7；79～75，3.3；74~70，3.0；69～65，2.7；64～60，2.3；59~0，0\r\n');
fprintf('\n');
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
