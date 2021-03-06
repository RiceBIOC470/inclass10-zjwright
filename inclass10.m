%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.
load('example_dat.mat');
[coeff, sc, eig]=pca(dat);
%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 
%just one (only one dimension, the 5.6314, is really significant, the
%others are insignificant. If you count the one that's 0.18, then it's 2 dimensions)

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 
ids=kmeans(dat,3);
x=1:8;
for ii=1:3
    inds=ids==ii;
    subplot(1,4,ii);
    plot(x,mean(dat(inds,:),1),'.-','LineWidth',1,'MarkerSize',15);
    hold on,
    title(['Cluster' int2str(ii)]);
end

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?
ids=kmeans(dat,7);
x=1:8;
for ii=1:7
    inds=ids==ii;
    subplot(1,7,ii);
    plot(x,mean(dat(inds,:),1),'.-','LineWidth',1,'MarkerSize',15);
    hold on,
    title(['Cluster' int2str(ii)]);
end
%3 clusters is beter, 7 has multiple that are similar enough to be in the
%same cluster