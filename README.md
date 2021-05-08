# Graph Characterisation using Graphlet-based Entropies
###  Aziz et al.

This repository provides code for the paper [Graph Characterisation using Graphlet-based Entropies](https://doi.org/10.1016/j.patrec.2021.03.031). To compute graphlets, the code provided by Nino Shervashidze [email](nino.shervashidze@tuebingen.mpg.de) was used which can also be downloaded from http://members.cbio.mines-paristech.fr/~nshervashidze/code/.

### Basic requirements
The code is implemented using MATLAB R2020b but may work with some older versions of MATLAB. It assumes that the graphs contains all the undirected, unlabelled graphs while labels variables are class variables for each graph.

## ComputeEntropy.m
The function ComputeEntropy is used to embed graphs using Graphlet-based Entropies. 

### Input
The input to the file computeEntropy is the cell array of adjacency matrices of the graphs.

### Output
The output is the 7-dimensional feature vector representation of each graph in the cell array.
