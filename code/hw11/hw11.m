%% Credits
% NCU IPES 葉昀翔 109605510 

%% 一元二次方程式

%% 輸入係數
coeff = input('輸入[a b c]： ');
a =  coeff(1);
b =  coeff(2);
c =  coeff(3);

%% 定x, y
x = linspace(-10,10,1000) ;
y = a.*x.^2 + b.*x + c ;

%% 畫圖
plot(x,y)
hold on
plot([-10 10],[0 0])
xlim([-10 3])

legend('4x^2+30x-42','5x^2+2x+10')

%% 判別式、計算x1, x2、輸出結果
D = b.^2 - 4.*a.*c ; 

if D<0 
    fprintf('無實數解\n')
    return
else
    x1 = (-b + sqrt(D)) / (2.*a) ;
    x2 = (-b - sqrt(D)) / (2.*a) ;
    fprintf('x1 = %5.3f    x2 = %6.3f\n',x1,x2)
end
