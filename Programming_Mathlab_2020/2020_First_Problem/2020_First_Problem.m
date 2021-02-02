%우선 사용자에게 A(mxm matrix)와 b(vector)을 입력받고,
%조건 1. A행렬의 (1,1)과 (마지막 row, 마지막 column) 값을 바꿔줍니다.
%조건 2. 마지막 열과 마지막 바로 전 열(last column -1)의 값들을 이중 for문을 통해 값을 바꿔줍니다.
%조건 3. 이중 for문을 통해 i와 j가 같으면 주 대각 성분의 값들을 +1 해줍니다
%조건 4. 내적을 하기 위해서 식을 직접 써보던 중 규칙을 찾아 삼중 for문을 통해 A(i,o)와 A(o,j)를 곱하고 0으로 초기화된 행렬 inner_product에 대입함으로써 내적을 구해줍니다.
%조건 5. x를 구하기 위해선 역행렬이 없어야 하고, 벡터 space와 차원이 같아야하므로 조건문을 추가하여 값을 구했다.
%번외: 행렬식이 0이면 해가 무수히 많거나 아예 없다. 행렬식을 구하기 위해서, det함수를 사용하던 중 행렬식 값이 0이 나와야하는데, 안나오는 경우가 있었다.
%따라서 matlab을 찾아보던중 rcound라는 함수가 있어서, 특이행렬일 때에는 값이 0에 가까워지고, 특이행렬이 아닐 때에는 1에
%가까워지는 함수를 찾았다. 그래서 round 함수와 함께 사용하여 소수점 9번째 자리를 반올림하여 근삿값을 만든다음 0.0000001 보다 작으면 특이행렬이라
%판단하여 조건문을 작성하였고, rank라는 함수를 통해 rank가 1이면 세 열 다 종속된 것이라 판단해 입력한 벡터와 비율이 같다면
%무한 해를 가지고, rank가 1인데, 벡터와 rank의 특정한 줄과 비율이 같지 않다면 해가 없다고 판단하였으며, rank가 1이
%아닐 경우에도 해가 없다고 판단해 조건문을 작성하였다.

% A 행렬 값 입력
A = input("A 입력: ");

% A 행렬 row와 column의 크기가 만약 다를 때 예외 처리하는 조건문
if size(A,1) ~= size(A,2)
    error("No Square Matrix")
end

% b 벡터 값 입력
b = input("b 입력: ");

% b 벡터가 row 또는 column이 1이 아닐 경우 예외 처리하는 조건문
if size(b,1) ~= 1 && size(b,2) ~= 1
    error("Wrong Vector Value")
end

%1번 조건
temp = A(1,1);
A(1,1) = A(size(A,2), size(A,2));
A(size(A,2), size(A,2)) = temp;

fprintf("Condition 1.")
A

%2번 조건
for i = 1:size(A,2)
    for j = 1:size(A,2)
        if j == size(A,2)
            temp =  A(i,size(A,2));
            A(i,size(A,2)) =  A(i,size(A,2)-1);
            A(i,size(A,2)-1) = temp;
        end
    end
end 

fprintf("Condition 2.")
A

% 3번 조건
for i = 1:size(A,2)
    for j = 1:size(A,2)
      if i == j 
          A(i,j) = A(i,j)+1;
      end
    end
end

fprintf("Condition 3.")
A

%내적 초기화
inner_product = zeros(size(A,2),size(A,2));

%4번 조건
for i = 1:size(A,2)
    for j = 1:size(A,2)
        for o = 1:size(A,2)
            inner_product(i,j) = inner_product(i,j) + A(o,j) * A(i,o);
        end
    end
end

fprintf("Condition 4.")
inner_product

if size(b,2) ~= 1
    transposeb = b.';
else
    transposeb = b;
end

%error message를 출력하게 하기위한 조건문
if size(A,2) ~= size(transposeb,1)
    error("Wrong Demension")
elseif round(rcond(inner_product),9) < 0.0000001    
    if rank(inner_product) ~= 1 %
        error("No solution")
    elseif rank(inner_product) == 1 
        compare = inner_product(1,1) / transposeb(1,1);
        for i = 2 : size(A,2)
            if compare ~= inner_product(i,1)/transposeb(i,1)
                error("No solution")
            else
                continue
            end
        end
        error("infinitely many solution")
    end 
else
    %5번 조건
    fprintf("Condition 5.")
    x = inner_product\transposeb  
end
        
