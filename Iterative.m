% Iterative method of calculating the PageRank value

function R = Iterative ( name, d, eps )
  % we open the input file
  file = fopen ( name, "r" );
  % we read the number of websites pages
  numberOfPages = fscanf ( file, "%d", 1 );
  A = zeros ( numberOfPages );
  for i = 1:numberOfPages
    % we read the code of our website page
    pageCode = fscanf ( file, "%d", 1 );
    % we read the number of links our page has
    numberOfLinks ( i ) = fscanf ( file, "%d", 1 );
    % we read the neighboors of our own page
    neighboors = fscanf ( file, "%d", numberOfLinks ( i ) );
    % we mark the adjancency in our adjancency matrix
    adjM ( i, neighboors ( j = 1:numberOfLinks ( i ) ) ) = 1;
    % in case our page has a link to itself we delete it and mark it as 0
    % we also decrease the number of links
    if ( adjM ( i, i ) == 1 )
      numberOfLinks ( i )--;
      adjM ( i, i ) = 0;
    endif
  endfor
  % we close our input file since we got all the information
  fclose ( file );

  % we initialize our initial PageRank vector with 1 / numberOfPages
  PR0 ( 1:numberOfPages, 1 ) = 1 / numberOfPages;
  PR1 = zeros ( numberOfPages, 1 );

  do
    for i = 1:numberOfPages
      % we calculate the sum of all PR ( j ) / L ( j ) where j is the code
      % of a page which has a link to page i
      sum = 0;
      for j = 1:numberOfPages
        if ( adjM ( j, i ) == 1 )
          sum = sum + PR0 ( j ) / numberOfLinks ( j );
        endif
      endfor
      % we calculate PR ( i ) at time t + 1
      PR1 ( i ) = ( 1 - d ) / numberOfPages + d * sum;
    endfor
    % we calculate the error as norm of PR at t + 1 and PR at t
    err = norm ( PR1 - PR0 );
    % in case we still have to keep going we move our result to PR0
    if ( err >= eps )
     PR0 = PR1;
    endif
  until err < eps
  R = PR0;

endfunction
