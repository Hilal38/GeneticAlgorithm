function y=mutation(x)
n=numel(x); 

j=randi([1 n]);

y=x;
y(j)=1-x(j);
end