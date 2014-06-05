function p=bar_plot(G)

no_g=size(G,1);

for g=1:no_g
    subplot(no_g,1,g),bar(G(g,:)); 
    axis([0 size(G,2)+1 0 1]);
end