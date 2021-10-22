% Developed by Hugo Nick
% Project : Derive seismic fragility curves for URM building in Basel
% Ecole Polytechnique Federale de Lausanne, Switzerland
% Last Update: October 19, 2021
%
%
% This code is developed to compare the capacity curves of the initial 
% model and of the model with the new modifications
%
%
% The aim of this comparison is to understand if there is an improvement 
% with the modification made and if yes, what kind of improvement

clear all
close all
clc

%% Comparison of the capacity curves

change = {'Spandrels'};                                                     % select the change made on the model

switch change{1}
    
    case 'Spandrels'
        types = {'M3_L_FF_mean', 'M3_L_FF_span_L_400'};                     % different types can be added (for example: increase the spandrel's length to 500 mm)
        
    % other cases                                                           % more cases can be added (for example: decrease of the openings)
    
end


figure('units','normalized','outerposition',[0 0 1 1])
hold on
for i = 1:length(types)                                                     % loop on all the modifications made for the case

    type = types{i};

    Para1000 = csvread(['capacity_curves_' type '.csv']);                   % read the corresponding file containing the 1000 generated capacity curves

    Para = mean(Para1000);                                                  % average of the parameters stored [Sdy, Sdu, Ty] in the file
    Para(1) = Para(1)/1000;                                                 % mean of Sdy
    Para(2) = Para(2)/1000;                                                 % mean of Sdu

    l_Sdu = 0:0.0001:Para(2);                                               % idealization of the capacity curve for the initial values
    l_Sa = [];
    
    for j = 1:length(l_Sdu)
        if l_Sdu(j) < Para(1)                                               % increasing part of the bilinear capacity curve
            l_Sa(j) = l_Sdu(j)*(2*pi()/Para(3))^2;                          % S_a(j) = S_du(j) * (2 * pi) / (T_y,mean^2)
        else                                                                % constant part of the bilinear capacity curve
            l_Sa(j) = Para(1)*(2*pi()/Para(3))^2;                           % S_a(j) = S_du,mean * (2 * pi) / (T_y,mean^2)
        end
    end

                                            
    type_txt = strrep(char(type),'_','\_');
    txt = [type_txt];
    plot(l_Sdu,l_Sa,'DisplayName',txt)                                      % plot the idealized capacity curve for the type i

end

hold off
title('Improvement on the capacity curve','Fontsize',16,'FontWeight','bold')
xlabel('S_d [m]','Fontsize',10,'FontWeight','bold');
ylabel('S_a [m/s^2]','Fontsize',10,'FontWeight','bold');
legend('Location','southeast')
legend show
