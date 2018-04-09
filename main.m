%main
clc
clear all
close all
plotcolor=['-b^';'-g*';'-ro';'-cx';'-ks';'-yd';'-mp';'-wh'];
marksize=10;
tic;
Nmat=[5,10,15,20];
for j=1:length(Nmat)
    clearvars -except j Nmat legnedmark plotcolor marksize eff
    
    N=Nmat(1,j); % no of fragments
%     fragments=[0:N-1];
    imax=21; % total no of peers 
    nilen=[0:N-1]';
    for i=1:imax
%         [nitemp,nilentemp]=genni(i,N)
%         ni{i,1}=nitemp;
%         nilen(i,1)=nilentemp;
        k=i;
        [eff(j,i)]=efficiency(N,nilen,k);
    end
    plot(eff(j,2:length(eff)),plotcolor(j,:),'LineWidth',2,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor','g',...
                'MarkerSize',marksize);
    grid on
    hold on
    legnedmark{j}= [num2str(N)];
    legend(legnedmark);
end
xlabel('peer group size');
ylabel('efficiency');
% axis([2,imax,.72,1])
ext=num2str(ceil(toc));
saveas(gcf,['plot' ext],'jpg');
save(['result' ext]);