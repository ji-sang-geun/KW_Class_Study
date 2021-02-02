%A = [5 2 0 -4 1; 3 1 -2 0 -4; -1 0 3 1 5; 2 3 1 4 -1; 0 1 1 -2 3]; % Non - Zero Pivot Cases 증명 A
%b = [6 3 1 0 1]; % Non - Zero Pivot Cases 증명 B 

A = [0 3 6 4 2; 1 0 5 7 3; 3 5 6 7 1; 6 7 1 2 5; 8 3 2 4 9]; % Zero pivot in the first row Cases 증명 A
b = [5 4 2 3 1]; % Zero pivot in the first row Cases 증명 B

x = slv(A,b); % x를 구하기 위해 slv 함수 사용
disp(x); % x 변수 값을 표시 

function [L,U,b] = slu(A,b) % 함수 slu를 정의 ( b를 추가한 이유는 row exchange를 할 때, b까지 값의 순서를 바꿔줘야 하기 때문 )
%   Square LU factorization with no row exchanges!
[n,n] = size(A); tol = 1.e-6; % size(A)로 A행렬의 row와 column 길이가 나오면서 n에 대입. 또한, tol에 1.e-6인 0.000001 대입함으로 초기화 시킴
for k = 1 : n % k가 1에서 1씩 증가하여 n이 될때까지 반복하는 반복문
    if abs(A(k,k)) < tol % tol이 0.000001 때문에 이보다 작은 값들을 다 0으로 판단해버린다는 뜻으로 행렬의 pivot들이 0으로 되면 안되기 때문에 판단하는 조건문.
        for a = k + 1 : n % k+1부터 n까지 반복하는 반복문. ( pivot들이 0보다 작기 때문에, 바꿔줘야 하므로 다음 row들의 값들을 바꾸기 위해 사용)
           if abs(A(a,k)) > tol % 만약 0.000001보다 크다면 pivot이 될 수 있으므로 바꿔주는 작업을 함
                Achange=A(k,:); % Achange라는 변수에 A행렬의 k row 값 전체를 대입. (값을 change하기 위함)
                A(k,:)=A(a,:); % A행렬의 k row 전체에 A행렬의 a row 값 전체를 대입.
                A(a,:)=Achange; % A행렬의 a row 전체에 Achange 값을 대입.
                bchange=b(k); % bchange라는 변수에 b행렬의 k row 값 하나 대입. (값을 change하기 위함)
                b(k)=b(a); % b행렬 k row 에 b행렬 a row 값 하나 대입.
                b(a)=bchange; % b행렬 a row에 bchange 값 하나 대입.
                break; % 값을 대입했기 때문에 break문으로 반복문 하나를 다시 빠져나와 검사.
           end 
        end
    end % Cannot proceed without a row exchange: stop
    L(k,k) = 1; % 아랫 삼각행렬 L에 주 대각 성분에 1을 대입.
    for i = k + 1 : n % i가 k+1값부터 n까지 반복하는 반복문
        L(i,k) = A(i,k)/A(k,k); % Multipliers for column k are put into L / % 아랫 삼각행렬 L에 A행렬 값을 pivot과 나눠준 값들을 대입.
        for j = k + 1 : n % Elimination beyond row k and column k / % j가 K+1 값부터 n까지 반복하는 반복문
            A(i,j)=A(i,j)-L(i,k) * A(k,j);  % Matrix still called A / % A행렬 (i,j) 값에 A(i,j)값에 아래 삼각행렬(i,k)값과 A(k,j)값을 곱한 값을 빼줌.
        end
    end
    for j = k : n % j가 k부터 n까지 반복하는 반복문
        U(k,j)=A(k,j); % 윗 삼각행렬 U에 행렬 바뀐 행렬 A값을 대입.
    end
end
end

function x = slv(A,b) % 함수 slv를 정의 ( 이 함수를 통해 x를 구하는 것이 목적 )
% Solve Ax = b using L and U from slu(A).
[L,U,b] = slu(A,b); s = 0; t = 0;  % No row exchanges! / % L,U,b 행렬을 slu(A,b)함수를 통해 불러옴. 또한 s과 t를 0으로 초기화 시킴.
[n, n] = size(A); % size 함수를 통해 A행렬의 row와 column 값을 받아 n에 대입.
for k = 1 : n % Forward elimination to solve Lc = b / % k가 1부터 n까지 반복하는 반복문
    for j = 1 : k - 1 % j가 1부터 k-1까지 반복하는 반복문 
        s = s + L(k,j) * c(j); % Add L times earlier c(j) before c(k) / % s에 자신과 아랫 삼각행렬 L의 (k,j) 값과 c(j)값을 곱하고 s 자기 자신을 더함
    end
    c(k) = b(k) - s; s=0; % Find c(k) and reset s for next k / % c(k)는 b(k)에 s를 뺀 값으로, 맨 처음 실행할 때, k = 1이고, j 는 1부터 k-1 값까지 반복하는 작업이 성사할 수 없으므로 c(k)에 값이 대입됨.
    % 또한, s를 다시 0으로 초기화하게함.
end
for k = n : -1 : 1 % Going backward from x(n) to x(l) / % k는 n값에서 -1을 빼 1이 될 때까지 반복하는 반복문
    for j = k + 1 : n % Back substitution / % j는 k+1값에서 n까지 반복하는 반복문
        t = t + U(k,j) * x(j); % U times later x(j) / % t에 윗 삼각행렬 U (k,j) 값과 x행렬 j row 값을 곱한 것에 t 자기 자신을 더함.
    end
    x(k) = (c(k) - t) / U(k,k); % Divide by pivot / x행렬 k row에 c행렬 k row에서 t값을 뺀 값에 윗 삼각행렬 (k,k) 값을 나누는 것을 대입
    t = 0; % t에 0을 대입하여 다시 t값이 0으로 초기화 하게 함.
end
x = x'; %Transpose to column vector % 전치 행렬을 해, x값이 세로로 나오게 함.
end
