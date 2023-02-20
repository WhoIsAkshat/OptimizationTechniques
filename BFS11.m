A=[-1 1 1 0;
    1 2 0 1]
b=[1;
    2]
C=[1 2 0 0];

% A=[2 3 -1 4;;
%     1 -2 6 -7]
% b=[8;
%    -3]
% C=[2 3 4 7];

[m n ]=size(A );

nCm=nchoosek(n,m );
pair= nchoosek(1:n,m);

sol=[]

for i=1:nCm
    y= zeros(n,1)
    B= A(:,pair(i,:));
    x= B\b;
    if all(x>=0 & x~=inf & x~=-inf)
        y(pair(i,:))= x;
        sol= [sol y];
    end
end

Z=C*sol;
[maxValue ,maxIndex]=max(Z);
BFS=sol(:,maxIndex);

optval=[BFS' maxValue];
OPTIMAL_BFS=array2table(optval);
OPTIMAL_BFS.Properties.VariableNames(1:size(OPTIMAL_BFS,2))={'x1','x2','s1','s2','max(Z)'};
OPTIMAL_BFS