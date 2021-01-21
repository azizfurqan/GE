function val = computeEntlast(gr)
len = length(gr(:,1));
vals = zeros(len,1);
for i=1:len
    temp_gr = gr;
    temp_gr(i,:) = [];
    temp_gr(:,i) = [];
    num_comp = graphconncomp(sparse(temp_gr));
    if(num_comp == 1)
        degs = sum(temp_gr);
        vals(i) = exp(-sum(1./(degs+1)));
    end
end
vals = vals/sum(vals);
vals = vals(vals~=0);
val = -sum(vals.*log2(vals));