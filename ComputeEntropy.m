function [ent] = ComputeEntropy(Graphs)
%compute entropy for individual graphlets

n=length(Graphs);
ent = zeros(n,7);

for i=1:n
    gr = cell2mat(Graphs(i));
    n_nodes = length(gr(1,:));    
    n_edges = sum(sum(gr))/2;
    ent(i,1) = log2(n_nodes);
    ent(i,2) = log2(n_edges);
    adj_list = adj2adjL(gr);
    vec = countconnected3graphlets(gr,adj_list);
    wt = exp(-[4/3 1]);
    psum = sum(wt.*vec);   
    ent(i,3) = -sum((wt.*vec/psum).*log2((wt/psum)));
    vec = countconnected4graphlets(gr,adj_list);
    wt = exp(-[1 7/6 17/12 7/4 4/3 5/3]);
    psum = sum(wt.*vec);
    ent(i,4) = -sum((wt.*vec/psum).*log2((wt/psum)));
    vec = countconnected5graphlets(gr,adj_list);
    wt = exp(-[1 11/10 6/5 37/30 4/3 41/30 3/2 5/3 29/20 19/12 23/15 7/4 2 7/5 3/2 97/60 7/4 11/6 28/15 25/12 11/5]);
    ent(i,5) = -sum((wt.*vec/psum).*log2((wt/psum)));
    ent(i,6) = computeEntlast2(gr);
    ent(i,7) = computeEntlast(gr);
    ent(isinf(ent)) = 0;
    ent(isnan(ent)) = 0;
    ent(i,:) = ent(i,:)/sum(ent(i,:));
end
ent(isinf(ent)) = 0;
ent(isnan(ent)) = 0;
