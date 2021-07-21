%% Credits
% NCU IPES 葉昀翔 109605510 

%% 多檔案處理

%% 清暫存
clc;
clear;
close;

%% 數據處理
for i=1:28
   %定檔名 開檔 讀檔
   file_name =  [num2str(i) '.txt'] ;
   fid = fopen(file_name,'r') ;
   A = fscanf(fid,'%f %f',[2 inf]) ;   %2列inf行
   A = A' ;   %inf列2行
   
   %單日採檢數
   len(i) = length(A) ;
   
   %單日確診數累積
   confirm_case(i) = 0 ;
   negative_case(i) = 0 ;
   for j=1:len(i)
      if A(j,2) > 35
          negative_case(i) = negative_case(i) + 1 ;
      else
          confirm_case(i) = confirm_case(i) + 1 ;
      end
   end
   
   %單日陽性率計算
   positive_rate(i) = 100*( confirm_case(i) / len(i) ) ;
   
   %定畫圖xy
   x(i) = i ;
   y1(i) = len(i) ;
   y2(i) = confirm_case(i) ;
   y3(i) = positive_rate(i) ;
   
   %關檔
   fclose(fid);
end

%% 畫圖
figure(1) ; subplot(3,1,1)
plot(x,y1,'bo-')
grid on ; grid minor
xlabel('日期')
ylabel('採檢數(人)')
xlim( [0,29] )
xticks( [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28] )

figure(1) ; subplot(3,1,2)
plot(x,y2,'ro-')
grid on ; grid minor
xlabel('日期')
ylabel('確診數(人)')
xlim( [0,29] )
xticks( [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28] )
yticks( [0 100 200 300 400 500 600] )

figure(1) ; subplot(3,1,3)
plot(x,y3,'go-')
grid on ; grid minor
xlabel('日期')
ylabel('陽性率(%)')
xlim( [0,29] )
xticks( [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28] )

sgtitle('番薯島COVID-19疫情')
