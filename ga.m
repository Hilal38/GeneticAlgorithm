clc
clear
close all;
%% definition of the problem

model=createmodel();
costfunction=@ (x) mycost(x, model);
Nvar=model.n; %number of variables 
%%
Npop=20;
birey.pozisyon=[];
birey.maliyet=[];
birey.solution=[];


pop =repmat(birey, Npop,1); 

for i=1:Npop
    pop(i).pozisyon = randi([0 1], 1, Nvar); % 1 satır Nvar sütun olacak şekilde ya 0 ya 1 olacak şekilde sayılar üret 
    [pop(i).maliyet pop(i).solution] = costfunction(pop(i).pozisyon);
end

%%
cost =[pop.maliyet];
[cost y]=sort([pop.maliyet]); 

pop=pop(y); 

best.sol=pop(1); 

%% main loop
iterasyon=100;
pc=0.7; % probability of crossover 
Npopc= round(Npop/2*pc);

pm=0.5;
Npopm = round(Npop*pm);
for it=1:iterasyon
   %How many people will cross over?
   %We create empty matrices to write the crossover result.
   %If the crossover rate is too high, it tries to destroy a chromosome that initially gives a good solution.
    popc=repmat(birey,Npop/2,2); 
    
    for k=1:Npop/2
        %selection random
        i1=randi([1 Npop]);
        pop1=pop(i1);

        i2=randi([1 Npop]);
        pop2=pop(i2);

        [popc(k,1).pozisyon popc(k,2).pozisyon]= singlepointcrossover(pop1.pozisyon, pop2.pozisyon);
        [popc(k,1).maliyet popc(k,1).solution] = costfunction(popc(k,1).pozisyon);
        [popc(k,2).maliyet popc(k,2).solution]= costfunction(popc(k,2).pozisyon);
    end
        
    popc=popc(:);
    
    %mutasyon - 
    popm=repmat(birey,Npop,1);

    for j=1:Npopm
        %selection random
         i1=randi([1 Npop]);
         pop1=pop(i1);

         popm(j).pozisyon = mutation(pop1.pozisyon);
         [popm(j).maliyet popm(j).solution] = costfunction(popm(j).pozisyon);
    
    end


    pop= [pop
        popc
        popm];


   cost =[pop.maliyet];
   [cost y]=sort(cost); 

pop=pop(y); 

best.sol(it)=pop(1); 


% Delete bad solutions
pop=pop(1:Npop); 
bestcost(it)=best.sol(it).maliyet;

end

figure;
plot(bestcost);
xlabel('iterasyon');
ylabel('Best sol');
%semilogx(bestcost);


