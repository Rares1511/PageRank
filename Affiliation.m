% function which calculates in which interval our PageRank value is
% in order for us to have a continues function we need to find the equation
% of the segment determined by the following points A ( val1, 0 ) and B ( val2, 1 )
% AB: ( x - val1 ) / ( val2 - val1 ) = ( y - 0 ) / 1;
% AB: y = 1/ ( val2 - val1 ) * x + (-val1) / ( val2 - val1 )

function y = Affiliation ( x, val1, val2 )
  slope = 1 / ( val2 - val1 );
  intercept =  - slope * val1;
	if ( x < val1 )
    y = 0;
  else
    if ( x <= val2 )
      y = slope * x + intercept;
    else
      y = 1;
    endif
  endif
endfunction
