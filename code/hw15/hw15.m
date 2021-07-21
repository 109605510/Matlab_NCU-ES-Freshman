%% Credits
% NCU IPES 葉昀翔 109605510 

%% 斜向拋射&棒球守備判斷

%% 清暫存
clc;
clear;
close;

%% 初值輸入&判斷
vars = input('輸入[V0 θ]：   (0<=V0<=40 5<=θ<=85) \n');
V0 =  vars(1);
theta =  vars(2);

if (V0<0 || V0>40) && (theta<5 || theta>85)
    fprintf('V0,θ超出合理範圍\n');
    return;
elseif V0<0 || V0>40
    fprintf('V0超出合理範圍\n');
    return;
elseif theta<5 || theta>85
    fprintf('θ超出合理範圍\n');
    return;
end

%% 計算 飛行時間t, 最大飛行距離D
g = 9.81 ;
t = 2*V0*sind(theta)/g ;
D = V0^2*sind(2*theta)/g ;

%% fly height at 122m
H_122 = tand(theta)*122 - (g*122^2)/(2*V0^2*cosd(theta)^2) ;

%% 判斷守備結果
if 0<=D && D<3
    condition = '捕手接殺' ;
elseif (3<=D && D<13) || (23<=D && D<30) || (46<=D && D<75)
    condition = '一壘安打' ;
elseif 13<=D && D<23
    condition = '投手接殺' ;
elseif (30<=D && D<46)
    condition = '內野手接殺' ;
elseif (75<=D && D<105)
    condition = '外野手接殺' ;
elseif (105<=D && D<122)
    condition = '二壘安打' ;
elseif (122<=D && H_122<=2.4)
    condition = '三壘安打' ;
elseif (122<=D && H_122>2.4)
    condition = '全壘打' ;
end

%% 軌跡方程式
x = linspace(0,130,1000) ;
y = tand(theta)*x - (g*x.^2)/(2*V0^2*cosd(theta)^2) ;

%% 畫圖
plot(x,y,'LineWidth',2)
grid on ; grid minor

title([ condition '！ t=' num2str(t) '  D=' num2str(D) ])
xlabel('水平距離(m)')
ylabel('垂直距離(m)')

xlim( [0,130] )
ylim( [0,45] )
xticks( [0 10 20 30 40 50 60 70 80 90 100 110 120 130] )

hold on
plot([0 3],[0 0],'r*-','LineWidth',2)
plot([13 23],[0 0],'y*-','LineWidth',2)
plot([30 46],[0 0],'*-','color',[0.9,0,1],'LineWidth',2)
plot([75 105],[0 0],'*-','color',[0,1,0],'LineWidth',2)
plot([122 122],[0 2.4],'k','LineWidth',2)

subtitle( ['初速=' num2str(V0) '°  仰角=' num2str(theta) '°'] )
