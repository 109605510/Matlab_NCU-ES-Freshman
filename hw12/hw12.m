%% Credits
% NCU IPES 葉昀翔 109605510 

%% 單檔案處理 比大小

%%  開檔
fid = fopen('hw12_data.txt','r') ;

%% 讀檔 為矩陣
A = fscanf(fid,'%f %f',[2 inf]) ;   %2列inf行
A = A' ;   %inf列2行

%% 比大小
big = -1E+06 ;
small = +1E+06 ;
for i=1:34000
   if A(i,2) >= big
      big = A(i,2) ;
   end
   if A(i,2) <= small
      small = A(i,2) ;
   end
end

%% 判斷絕對值大小
if abs(small) >= abs(big)
    big = small ;
end

abig = abs(big) ;
fprintf('PGA = %f cm/s^2\n',abig)

%% 判斷震度
if (0.0<=abig && abig<=0.8)
    fprintf('震度 = 0\n')
elseif(0.8<=abig && abig<=2.5)
    fprintf('震度 = 1\n')
elseif(2.5<=abig && abig<=8.0)
    fprintf('震度 = 2\n')
elseif(8.0<=abig && abig<=25)
    fprintf('震度 = 3\n')
elseif(25<=abig && abig<=80)
    fprintf('震度 = 4\n')
elseif(80<=abig && abig<=250)
    fprintf('震度 = 5\n')
elseif(250<=abig && abig<=400)
    fprintf('震度 = 6\n')
elseif(400<=big)
    fprintf('震度 = 7\n')
end

%% 繪圖
x = A(:,1) ;
y = A(:,2) ;

plot(x,y,'b')

xlim( [0,170] )
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170])
ylim( [-150,150] )
yticks([-150 -125 -100 -75 -50 -25 0 25 50 75 100 125 150])
    
title('Station Code:CHY064')
xlabel('Time(second)')
ylabel('Amplitude(cm/s^2)')

grid on
grid minor

%% 關檔
fclose(fid);
