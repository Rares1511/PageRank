% function which returns the inverse of a matrix by using the gram-schmidt method

function inverse = Inverse ( Mat )
  [n, n] = size( Mat );
  Q = zeros ( n );
  R = zeros ( n );

  % we calculate the Q and R matrix which make the equation true: Mat = Q * R
  % calculama matriciile Q si R ce respecta ecuatia A = Q * R
  for j = 1:n
    R ( 1:j-1, j ) = Q ( :,1:j - 1 )' * Mat ( :, j );
    u = Mat ( :, j ) - Q ( :, 1:j - 1 ) * R ( 1:j - 1, j );
    R ( j, j ) = norm ( u );
    Q ( :, j ) = u / R ( j, j );
  endfor

  % in order for us to determine the inverse of the matrix we have the equation
  % Mat * Mat ^ (-1) = I
  % so our equation becomes Q * R * Mat ^ (-1) = I
  % but Q' = Q * (-1)
  % so our new equation is R * Mat ^ (-1) = Q'
  % but R is an upper triangular matrix so we have an system formed of upper triangular system to solve
  % in which our column vector for system i is the i column of Q'

  for i = 1:n
    inverse ( :, i ) = UTS ( R, Q' ( :, i ) );
  endfor

endfunction
