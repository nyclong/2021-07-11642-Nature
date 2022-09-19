% baseline pulling & dF/F calculation
%%
% read data, data length 
clc;
clear;

data = xlsread('female.csv');
raw = data(:,3);
plot(raw);
%%
graw = raw(raw>16);
craw = raw(raw<=16);
% plot data to decide the value that should be added
g6 = graw(1:length(craw)-craw);
plot(g6);
% hold on 
%%
% df/f use 800-900 region as F0
gF0 = mean(g6);
% rF0 = mean(rraw);
gdff = (g6-gF0)/gF0;
% rdff = (rraw-rF0)/rF0;
plot(gdff);
%% filter or smooth
windowSize = 6; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
gfdff = filter(b,a,gdff);
plot(gfdff);
xlswrite('female_dff.xlsx',gfdff);
% %%
% windowSize = 15; 
% b = (1/windowSize)*ones(1,windowSize);
% a = 1;
% gfdff2 = filter(b,a,gdff);
% figure;
% plot(gfdff2);
