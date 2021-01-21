function val = computeEntlast2(gr)
len = length(gr(:,1));
vals = zeros(len*(len-1)/2,1);
k = 0;
for i=1:len-1
    for j=i+1:len
        temp_gr = gr;
        temp_gr(i,:) = [];
        temp_gr(:,i) = [];
        temp_gr(j-1,:) = [];
        temp_gr(:,j-1) = [];
        num_comp = graphconncomp(sparse(temp_gr));
        k = k+1;
        if(num_comp == 1)
            degs = sum(temp_gr);            
            vals(k) = exp(-sum(1./(degs+1)));
        end
    end
end
vals = vals/sum(vals);
vals = vals(vals~=0);
val = -sum(vals.*log2(vals));