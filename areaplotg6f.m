

% a = (1:5);
% b = 0.5*ones(1,5);
% axis([-15 15 -15 15]);
% basevalue = -9;
% area(a,b,basevalue,'FaceColor',[0.5 0.9 0.6],'EdgeColor',[0.5 0.9 0.6]);


% read the event duration and calcium data
g = xlsread('male_MMP8_FP_pre4_female_dff.xlsx');
dur = xlsread('male_MMP8_FP_pre4_female_event.xlsx');

figure;
plot(g);
hold on

dur_s = dur(:,1);
dur_e = dur(:,2);
for i = 1:length(dur_s)
    a = dur_s(i):dur_e(i);
    b = 1:length(a);
    basevalue = -0.5;
    area(a,b,basevalue,'FaceColor',[0.5 0.9 0.6],'EdgeColor','none');
    i = i+1;
end
axis([0 length(g) -0.2 0.3]); % axis limit
alpha(0.3);
saveas(gcf,'male_MMP8_FP_pre4_female','jpg');




