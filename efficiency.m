function[eff]=efficiency(N,n,k)
and=1;
lenn=length(n);
for i=1:lenn
    temp1(1,i)=(N-n(i,1))/(N*(n(i,1)+1));
end
temp2=temp1.^k;
temp3=temp2/N;
eff=1-sum(temp3);
end