%converte arquivo de dados brutos da genera para formato compatível com
%copy/paste do site https://prs.byu.edu/calculate_score.html polygenic risk
%score
%Luciano Menegaldo - Coppe/UFRJ
clear global
clear all
fclose('all')
arquivo='137614.csv';
arq_saida='saida4.txt';
G0 = readtable(arquivo);
N0=height(G0)
G = sortrows(G0,'RSID','ascend');

%load G
HG=height(G);
P0=table(G.RSID,G.RESULT);
 %writetable(P0,'prs.txt'); %também elimina entradas repetidas
 %writetable(unique(P0),'prs.txt'); %também elimina entradas repetidas
 P1=importdata('prs.txt');
 P1(1)=[];
 P2=strrep(P1,',',':');
 N=length(P2);
 delete(arq_saida)
 fileID=fopen(arq_saida,'w')
  

        for i=1:HG,
           if i > size(P2),
             break
           else
               linha=char(P2(i));
              if contains(linha,'I','IgnoreCase',true) ==0, %elimina alelos I
                 if contains(linha,'-','IgnoreCase',true) ==0, %elimina alelos -
                    if contains(linha,'D','IgnoreCase',true) ==0, %elimina alelos D
                       if contains(linha,':,','IgnoreCase',true) ==0, %elimina alelos sem duplicata :,
                          if contains(linha,',:','IgnoreCase',true) ==0, %elimina alelos sem duplicata ,:
                             if linha(1:2) == 'rs', %elimina linhas extras por causa da função unique
                                    linha2=strcat(linha(1:end-1),',',linha(end));,
                                    if contains(linha2,':,','IgnoreCase',true) ==1,
                                       % i
                                        disp('tem :,')
                                        %pause            
                                    else
                                        fprintf(fileID,'%s\n', linha2);
                                    end
                             end
                          end
                       end
                    end
                 end
              end
           end
           
     
     %writematrix(linha2,'saida.txt','QuoteStrings',0,'WriteMode','append')
     home
     i
      end
  %end
  
 fclose(fileID)
 
 
 
 
 
 
