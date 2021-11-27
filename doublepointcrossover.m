function [kiz erkek] = doublepointcrossover(anne, baba)
%her kromozomda kaç gen var

n=numel(anne); %bir satırda kaç eleman olduğunu sayar numel yani 4 tane xilerin gen sayısı
%Bir kromozomu n-1 yerden kesebiiriz.
cutpoint=randi([1 n-1], 1,2); %Burada seçilen noktalardan hangisinin küçük-büyük old önemli
c1 = min(cutpoint);
c2 = max(cutpoint);

%tek noktaliçaprazlama
kiz=[anne(1: c1) baba(c1 + 1: c2) anne(c2+1:end)] ; % +1 diyoruz kesme noktasından sonası
erkek=[baba(1: c1) anne(c1 + 1: c2) baba(c2+1:end)];

end