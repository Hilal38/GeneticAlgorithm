
function [z solution]=mycost(x, model) 
w=model.w;
v=model.v;
W=model.W;

alpha=10000;

violation = max(sum(w.*x)/W-1, 0);

z=sum(v.*(1-x)) +alpha*violation;

solution.gainedweight = sum(w.*x);
solution.gainedvalue= sum(v.*x);
solution.W=W;
solution.isfeasible = (violation==0);

end