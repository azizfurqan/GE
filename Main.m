clear
clc

prompt = 'Type a number (1-9): \n1. MUTAG \n2. AIDS \n3. NCI1 \n4. NCI109 \n5. PTC-MR \n6. PTC-MM \n7. PTC-FR \n8. PTC-FM \n9. COX2\n-> ';
num =  sscanf(input(prompt, 's'), '%d');
fprintf('\n');

%Read dataset
%We assume that the mat file contains the following two variables 
%1. graphs: the set of n graphs
%2. labels: a vector of labels

switch num
    case 1
        load mutag.mat
        rng(94)                 %For reproducibility
    case 2
        load AIDS.mat
        rng(186)                 %For reproducibility
    case 3
        load nci1.mat
        rng(1066)                 %For reproducibility    %376
    case 4
        load nci109.mat
        rng(1095)%28)                 %For reproducibility 1095
    case 5
        load PTC_MR.mat
        rng(97)%168)%638)                 %For reproducibility    %168+10d
    case 6
        load PTC_MM.mat
        rng(1296)                 %For reproducibility
    case 7
        load PTC_FR.mat
        rng(1932)                 %For reproducibility
    case 8
        load PTC_FM.mat
        rng(752)                 %For reproducibility
    case 9
        load cox2.mat
        rng(9)                 %For reproducibility %186
end


n=length(graphs);
ent_vecs = ComputeEntropy(graphs);


%Compute the classification accuracy using support vector machine.
mdlSVM = fitcsvm(ent_vecs,labels,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
CVMdl = crossval(mdlSVM);
L = 1-kfoldLoss(CVMdl,'mode','individual');

disp(strcat('Accuracy: ',num2str(round(100*mean(L),2)),'±',num2str(round(100*std(L)/sqrt(length(L)),2))));
