% function which resolves an upper triangular system and returns the solution

function x = UTS ( U, b )
  [n, n] = size ( U );
  x = zeros ( n, 1 );

  for i = n:-1:1
    x ( i ) = ( b ( i ) - U (i, i + 1:n ) * x ( i + 1:n ) ) / U ( i, i );
  endfor

endfunction
