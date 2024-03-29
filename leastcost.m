cost = [7 6 9; 5 7 3; 4 5 8];
a = [20 28 17]; %supplies
b = [21 25 19]; % demand
% check balanced or unbalanced
if sum(a) == sum(b)
    fprintf('Balanced\n');
else
    fprintf('Unbalanced');

    if sum(a) < sum(b)
        cost(end + 1, :) = zeros(1, size(a, 2));
    elseif sum(b) < sum(a)
        cost(:, end + 1) = zeros(1, size(a, 2));
    end

end

icost = cost;
x = zeros(size(cost));
[m, n] = size(cost);
bfs = m + n - 1;

for i = 1:size(cost, 1)

    for j = 1:size(cost, 2)
        hh = min(cost(:)); %minimum cost
        [row_index, col_index] = find(hh == cost); % cell with min cost
        x11 = min(a(row_index), b(col_index));
        [val, ind] = max(x11); % finding max allocation
        ii = row_index(ind); % row position
        jj = col_index(ind); % col position
        y11 = min(a(ii), b(jj)); % find the value
        x(ii, jj) = y11; % assign allocation
        a(ii) = a(ii) - y11; % reduce row value
        b(jj) = b(jj) - y11; % reduce column value
        cost(ii, jj) = inf; % cell visited
    end

end

%print bfs
fprintf('Initial BFS= \n');
ib = array2table(x);
disp(ib);
totalbfs = length(nonzeros(x));

if totalbfs == bfs
    fprintf('Non Degenerate BFS \n');
else
    fprintf('Degenerate BFS \n');
end

initialcost = sum(sum(icost .* x));
fprintf('Cost= %d\n', initialcost);
