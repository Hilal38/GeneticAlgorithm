function [kiz erkek] = singlepointcrossover(anne, baba)

%Her kromozomda kaç gen var bulmalıyız.
n=numel(anne);

%Kesme noktasını rastgele seçmeliyiz. randi komutu ile

cutpoint=randi([1 n-1]);

%tek noktalı çaprazlama
kiz=[anne(1:cutpoint) baba(cutpoint+1:end)];
erkek=[baba(1:cutpoint) anne(cutpoint+1:end)];

end