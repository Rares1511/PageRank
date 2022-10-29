% function which shows the output of the 2 methods of calculation for the PageRank value
% and the outputs the affiliation depending on the algebraic method

function [R1 R2] = PageRank ( name, d, eps )
  % we set our precision to 6 decimals
  output_precision ( 7 );
  % we open our input file
  in = fopen ( name, "r" );
  % we also create our output file
  out = fopen ( strcat ( name, '.out' ), "w" );
  % we read the number of pages
  numberOfPages = fscanf ( in, "%d", 1 );
  for i = 1:numberOfPages
    % we read the code of the page
    pageCode = fscanf ( in, "%d", 1 );
    % we read the number of links
    numberOfLinks = fscanf ( in, "%d", 1 );
    % we read the vector of neighboors of our current page
    % by neighboor we mean the code of the pages to which our page has a link
    neighboors = fscanf ( in, "%d", numberOfLinks );
  endfor
  % we read our val1 and val2 which determine the affiliation
  val1 = fscanf ( in, "%f", 1 );
  val2 = fscanf ( in, "%f", 1 );
  % we close our input file since we've read all the information
  fclose ( in );
  % we then output the number of pages
  fprintf ( out, "%i\n", numberOfPages );

  % we now use the iterative method and the output the result
	PR = Iterative ( name, d, eps );
  fprintf ( out, "%f\n", PR ( i = 1:numberOfPages ) );
  fprintf ( out, "\n" );

  % we now use the algebraic method and the output the result
  PR = Algebraic ( name, d );
  fprintf ( out, "%f\n", PR ( i = 1:numberOfPages ) );
  fprintf ( out, "\n" );

  % we create a matrix with the number of pages lines and 2 colums
  % the first colum has the PageRank value
  % the second colum has the code of the page that has that PageRank value
  PR1 = ones ( numberOfPages, 2 );
  PR1 ( :, 1 ) = PR;
  PR1 ( i = 1:numberOfPages, 2 ) = i;
  % we the sort the matrix in such a way that the PageRank values are in descending order
  PR1 = Sort ( PR1 );

  % we then output the results in the following form: i j V
  % i -> the code of current step
  % j -> the code of the page that has the PageRank value at step i
  % V -> the value of the affiliation
  for i = 1:numberOfPages
   fprintf ( out, "%d %d %f\n", i, PR1 ( i, 2 ), Affiliation ( PR1 ( i, 1 ), val1, val2 ) );
  endfor

  % we now close the output file
  fclose ( out );
endfunction
