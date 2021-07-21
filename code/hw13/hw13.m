%% Credits
% NCU IPES 葉昀翔 109605510 

%% 矩陣元素拆解

%% main
% 變數為矩陣A,B
A = [1 2 ; 2 -3] ;
B = [11 ; 16] ;

detA = A(1,1)*A(2,2)-A(1,2)*A(2,1) ;

if detA~=0
   inv_A = (1/detA).*[A(2,2) -A(1,2) ; -A(2,1) A(1,1)] ;
   X = inv_A*B ;
   fprintf('X = [x;y] = [%4.2f;%4.2f]\n',X)
   
   x1 = linspace(0,25,100) ;
   y1 = ( B(1,1)-A(1,1)*x1 ) / A(1,2) ;
   plot(x1,y1)
   hold on
   x2 = linspace(0,25,100) ;
   y2 = ( A(2,1)*x2-B(2,1) ) / -A(2,2) ;
   plot(x2,y2)
else
    fprintf('A無反矩陣')
    return
end
