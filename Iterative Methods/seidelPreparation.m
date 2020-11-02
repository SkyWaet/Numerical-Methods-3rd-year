function [H_L,H_R] = seidelPreparation(H_D)
    H_L = zeros(size(H_D,1),size(H_D,1));
    H_R = zeros(size(H_D,1),size(H_D,1));
    for i=1:size(H_D,1)
     for j=1:size(H_D,1)
          if(j>=i)
            H_R(i,j)=H_D(i,j);
         else
            H_L(i,j)=H_D(i,j);
          end
     end             
    end
end

