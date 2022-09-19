clear;
clc
% read calcium data and event time
g6f = xlsread('female_dff.xlsx'); % PASTE name of the file here
events = xlsread('female_event.xlsx'); % PASTE name of the file here
% round the event time
event = round(events);
% define different event time
ev = event(:,1);
% delete the NaN
ev(isnan(ev)) = [];
% plot whole trace of calcium signal
figure;
plot(g6f,'k');
hold on

% draw event line on the trace
x_ev = [ev'; ev'];
y_ev = [(min(g6f)-0.1)*ones(length(ev),1)'; (max(g6f)+0.1)*ones(length(ev),1)'];

line(x_ev,y_ev,'Color','b');
saveas(gcf,'image1.jpg');

% event_calcium
% 2s before and after event, write out the data into excel

for i = 1:length(ev)
    ev_cal(:,i) = g6f(ev(i,1)-80:ev(i,1)+79);
    i = i+1;
end

figure;
plot(ev_cal);
saveas(gcf,'image22.jpg');

% write into excel
xlswrite('female_singleevent.xlsx',ev_cal);
