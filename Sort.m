% function which sorts a matrix in such an order that the elements in the first
% column are in a descending order by moving whole lines

function S = Sort ( A )
  [n, m] = size ( A );
  for i = 1:n
    % we find the max which should be on the i position
    Max = A ( i, 1 );
    poz = i;
    for j = i + 1:n
      if ( Max < A ( j, 1 ) )
        Max = A ( j, 1 );
        poz = j;
      endif
    endfor
    % we then swipe line i with the line that has the maximum value
    t = A ( poz, : );
    A ( poz, : ) = A ( i, : );
    A ( i, : ) = t;
  endfor
  S = A;
endfunction
