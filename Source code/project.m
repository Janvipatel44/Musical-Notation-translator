clear, clc;
music
svarlipi = imread('input4.png');
ocrResults_1 = ocr(svarlipi);
text_ext = (ocrResults_1.Text);
j=1;

for i=1:length(text_ext)
    if (isletter(text_ext(i)) == 1)
        new_ex_1(j) = text_ext(i);
        j = j+1;
    end
    
    if(text_ext(i)=='i')
        new_ex_1(j-1) = 'F';
    end
end
new_ex_1

if(t==0) 
j=1;
cnt=0;
temp=' ';
for i=1:length(txt)
     if (isletter(txt(i)) == 1 && f(i)~='r' && (temp==' ' || temp=='|' || temp=='[' || temp==']'))
         if(new_ex_1(j)=='b')
             j=j+1;
         end
         if(new_ex_1(j) ~= upper(f(i)))
             f=insertAfter(f,k-1,lower(new_ex_1(j)));
             break;
         end
         j=j+1;
     end
     if(temp==txt(i) && temp~="'" && cnt==0)
         k=i;
         cnt=1;
     end
     temp=txt(i);
     
end
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly','\version "2.16.0" {', 'delimiter', '');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly', f, 'delimiter', '', '-append');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly','}', 'delimiter', '', '-append');
else
    
    disp('p');
    j =1;
    for i = 1:length(new_ex_1)
        if(new_ex_1(i)=='I')
            f(j)='|';
            j = j+1;
        end
        if(new_ex_1(i)=='A'|| new_ex_1(i)=='B'||new_ex_1(i)=='C'||new_ex_1(i)=='D'|| new_ex_1(i)=='E' || new_ex_1(i)=='F' ||new_ex_1(i)=='G')
            f(j) = lower(new_ex_1(i));
            f(j+1) ="'";
            f(j+2) =" ";
            j = j+3;
        end
    end
    temp = f;
    j=1;
    for i = 1: length(f)
       if(temp(i)== 'f')
        f(j) = 'f'; 
        f(j+1) = 'i';
        f(j+2) = 's';
        j = j+3;
       
       else
           f(j) = temp(i);
           j = j+1;
       end
    end
    j = 1;
    cnt = 0;
    for i = 1: length(f)-1
       if (cnt==0)
           f1(i) = f(i);
       end

       if(f(i)=='|' && f(i+1)=='|')
           cnt = 1;
           i = i +1;
           j = 1;
       end
       
       if (cnt==1)
           f2(j) = f(i);
           j = j+1;
       end
       
     
    end 
    
    for i = 1:length(f1)-1
        f1(i) = f1(i);
    end
    j=1;
    for i = 3:length(f2)
        f2(j) = f2(i);
        j = j+1;
    end
    
   
    
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly','\version "2.16.0" {', 'delimiter', '');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly', f1, 'delimiter', '', '-append');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly','}', 'delimiter', '', '-append');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly',' {', 'delimiter', '','-append');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly', f2, 'delimiter', '', '-append');
    dlmwrite('S:\Study Sem\Sem 6\Algorithmic music\Project\out.ly','}', 'delimiter', '', '-append');
   
end
    
f


