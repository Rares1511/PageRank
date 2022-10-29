% Algebraic method of calculating the Pagerank value

function R = Algebraic ( name, d )

  % we open the input file
  file = fopen ( name, "r" );
  % we read the number of website pages
  numberOfPages = fscanf ( file, "%d", 1 );
  for i = 1:numberOfPages
    % we read the code of the website page
    pageCode = fscanf ( file, "%d", 1 );
    % we read the number of links our website page has
    numberOfLinks ( i ) = fscanf ( file, "%d", 1 );
    % we read the pages to which our own has links to
    neighboor = fscanf ( file, "%d", numberOfLinks ( i ) );
    % we then go through our neighboor vector and mark it into our adjacency matrix
    adjM ( i, neighboor ( j = 1:numberOfLinks ( i ) ) ) = 1;
    % in case our page has a link to itself we delete it and mark it as 0
    % and decrease the number of links from that page
    if ( adjM ( i, i ) == 1 )
       adjM ( i, i ) = 0;
       numberOfLinks ( i )--;
     endif
  endfor
  % we close the input file since we've got all the information
  fclose ( file );

  % we get the K matrix which contains the values of numberOfLinks on its diagonal
  K = diag ( numberOfLinks );
  % we calculate our M matrix with the following formula ( K ^ (-1) * AdjM )'
  M = ( Inverse ( K ) * adjM )';
  % we calculate the PageRank vector with the following formula:
  % R = ( I - d * M ) ^ (-1) * ( 1 - d ) / n * 1;
  % where 1 is the vector with numberOfPages lines and 1 column and has only values of 1
  R = Inverse ( eye ( numberOfPages ) - d * M ) * ( 1 - d ) / numberOfPages * ones ( numberOfPages, 1 );

endfunction
