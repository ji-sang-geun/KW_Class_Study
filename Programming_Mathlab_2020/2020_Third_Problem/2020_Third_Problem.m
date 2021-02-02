CompareA = zeros(20,20); % CompareA 20*20 배열의 성분들을 0으로 초기화
A = zeros(20,20); % A도 마찬가지로 20*20 배열의 성분들을 0으로 초기화
b = zeros(20,1); % b는 output.mat를 값을 받아야하기 때문에, 20*1 배열의 성분들을 0으로 초기화

bload = load('output.mat'); % load함수를 사용하여 output.mat 파일에서 값들을 bload.output으로 가져옴
b = bload.output(:,1); %bload.output이 output.mat에서 대입한 값을 가지고 있기 때문에 b로 옮김

for t = 0.01:0.01:0.2 % t가 0.01~0.2까지 0.01 씩 증가하는 반복문 (세로를 담당함)
     j = int32(t*100); % int32를 쓴이유는 가끔씩 float형들이 나와 반복문을 방해하여 정수형으로 모조리 바꿈 또한, t*100을 한 이유는 t의 시작점이 0.01이기 때문
    for freq = 11:30 % freq는 Hz를 나타내는 것으로 11~30까지 1씩 증가하는 반복문 (가로를 담당함)
        i = freq-10; % i는 freq가 11이기 때문에 10을 빼서 A배열에 1부터 입력받게하기 위함
        answer = 2*pi*t*freq; % answer은 문제에서 주어진 계산식(2*pi*time*Hz)을 의미함
        A(j,i) = cos(answer); % A행렬에 cos(2*pi*time*Hz)를 집어넣는다.
    end
end

CompareA = inv(A); % slv한 값과 결과를 비교하기 위해 A행렬을 역행렬로 바꿈
CompareX = CompareA * b; % slv한 값은 결국 x를 나타내기 때문에, (inv로 역행렬한 A)*b로 비교하기 위해 대입.-

x = slv(A,b); % x를 구하기 위해 slv 함수 사용
disp("slv를 통해 구한 x값 출력");
disp(x); % x 변수 값을 표시 
disp("inv를 통해 구한 CompareX값 출력");
disp(CompareX);

plot(x,"R"); % slv로 나온 값인 x를 빨간색 그래프로 표시
hold ON; % 그래프를 둘다 보이게 하기위함
plot(CompareX , "B"); % inv(A)*b로 나온 값인 CompareX를 파란색 그래프로 표시
hold off; % 그래프 중첩 종료

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
