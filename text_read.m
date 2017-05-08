% read text
function text_read = text_read(param_first,param_last)
    fileID = fopen('all_fitur.csv','r');
    i=1;
    name = {};
    while true
      thisline = fgetl(fileID);
      if ~ischar(thisline); 
          break; 
      else
          name = [name; {thisline}];
          %disp(thisline);
          i=i+1;
      end  %end of file
    end
    fclose(fileID);
    text_read = name(param_first:param_last);  %(1:3)    %402
    %disp(text_read)
