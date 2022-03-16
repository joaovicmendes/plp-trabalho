%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% autor 1: João Victor Mendes Freire – RA: 758943
% autor 2: Julia Cinel Chagas – RA: 759314
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Link do problema: https://rachacuca.com.br/logica/problemas/amigas-na-escola/

% Pessoa é representada por uma lista que contém:
%   Pessoa = [ posição, mochila, nome, materia, animal, cidade, suco ]
% A entrada do problema é uma lista de pessoas:
%   Lista = [Pessoa1, Pessoa2, Pessoa3, Pessoa4, Pessoa5]

% Pessoa1 à esquerda de Pessoa2
a_esquerda_de([P1, _, _, _, _, _, _], [P2, _, _, _, _, _, _]) :- P1 < P2.
exatamente_a_esquerda_de([P1, _, _, _, _, _, _], [P2, _, _, _, _, _, _]) :- P1 is P2 - 1.

% P1 à direita de P1
a_direita_de([P1, _, _, _, _, _, _], [P2, _, _, _, _, _, _]) :- P1 > P2.
exatamente_a_direita_de([P1, _, _, _, _, _, _], [P2, _, _, _, _, _, _]) :- P1 is P2 + 1.

% P1 ao lado de P2
ao_lado_de(Pessoa1, Pessoa2) :- 
    exatamente_a_esquerda_de(Pessoa1, Pessoa2);
    exatamente_a_direita_de(Pessoa1, Pessoa2).

% Resolução
resolve(Sol) :-
    % Solução base vazia
    Sol = [
        [0, M0, N0, Mat0, A0, C0, S0],
        [1, M1, N1, Mat1, A1, C1, S1],
        [2, M2, N2, Mat2, A2, C2, S2],
        [3, M3, N3, Mat3, A3, C3, S3],
        [4, M4, N4, Mat4, A4, C4, S4]
    ],

    % Dicas
    % Joana gosta de suco de Abacaxi
    member([_,_,joana,_,_,_,abacaxi], Sol),
    % A menina que tem Hamsters gosta de estudar Artes
    member([_,_,_,artes,hamsters,_,_], Sol),
    % O suco favorito de Ana é de Limão
    member([_,_,ana,_,_,_,limao], Sol),
    % Jéssica está exatamente à esquerda da Renata
    member([PJessica,_,jessica,_,_,_,_], Sol),
    member([PRenata,_,renata,_,_,_,_], Sol),
    exatamente_a_esquerda_de([PJessica,_,jessica,_,_,_,_], [PRenata,_,renata,_,_,_,_]),
    % Pati é a primeira da esquerda
    member([0,_,pati,_,_,_,_], Sol),
    % A menina mais à direita gosta de estudar Artes
    member([4,_,_,artes,_,_,_], Sol),
    % Quem toma suco de Laranja gosta de Cavalos
    member([_,_,_,_,cavalos,_,laranja], Sol),
    % A pessoa que gosta de suco de Limão está no meio
    member([2,_,_,_,_,_,limao], Sol),
    % A mochila da Jéssica é Verde
    member([_,verde,jessica,_,_,_,_], Sol),
    % A menina exatamente à esquerda da do meio viajará Florianópolis
    member([1,_,_,_,_,florianopolis,_], Sol),
    % Quem quer viajar pra Recife tem a mochila Amarela
    member([_,amarela,_,_,_,recife,_], Sol),
    % A menina que gosta do suco de Abacaxi senta ao lado da que viajará para Fernando de Noronha
    member([PAbacaxi,_,_,_,_,_,abacaxi], Sol),
    member([PNoronha,_,_,_,_,noronha,_], Sol),
    ao_lado_de([PAbacaxi,_,_,_,_,_,abacaxi], [PNoronha,_,_,_,_,noronha,_]),
    % A dona da mochila Vermelha vai viajar para Fernando de Noronha
    member([_,vermelha,_,_,_,noronha,_], Sol),
    % A primeira menina da esquerda usa uma mochila Amarela
    member([0,amarela,_,_,_,_,_], Sol),
    % A menina da mochila Azul tem Cachorros
    member([_,azul,_,_,cachorros,_,_], Sol),
    % Quem gosta de Biologia senta ao lado da menina que tem Hamsters
    member([PBiologia,_,_,biologia,_,_,_], Sol),
    member([PHamsters,_,_,_,hamsters,_,_], Sol),
    ao_lado_de([PBiologia,_,_,biologia,_,_,_], [PHamsters,_,_,_,hamsters,_,_]),
    % A garota que senta exatamente à direita de quem gosta de História prefere Matemática
    member([PMatematica,_,_,matematica,_,_,_], Sol),
    member([PHistoria,_,_,historia,_,_,_], Sol),
    exatamente_a_direita_de([PMatematica,_,_,matematica,_,_,_], [PHistoria,_,_,historia,_,_,_]),
    % % Quem gosta de suco de Laranja senta ao lado de quem gosta de suco de Maracujá
    member([PLaranja,_,_,_,_,_,laranja], Sol),
    member([PMaracuja,_,_,_,_,_,maracuja], Sol),
    ao_lado_de([PLaranja,_,_,_,_,_,laranja], [PMaracuja,_,_,_,_,_,maracuja]),
    % Viajará para o Rio de Janeiro a menina que tem a mochila Preta
    member([_,preta,_,_,_,rio,_], Sol),
    % A garota que gosta de suco de Morango tem Pássaros como animal de estimação
    member([_,_,_,_,passaros,_,morango], Sol),
    % A menina que gosta de Biologia senta ao lado da que gosta de Português
    member([PBiologia,_,_,biologia,_,_,_], Sol),
    member([PPortugues,_,_,portugues,_,_,_], Sol),
    ao_lado_de([PBiologia,_,_,biologia,_,_,_], [PPortugues,_,_,portugues,_,_,_]),
    % Jéssica viajará para Salvador nas férias
    member([_,_,jessica,_,_,salvador,_], Sol),

    % Distribuindo valores restantes e garantingo que todos são valores permitidos
    permutation([M0, M1, M2, M3, M4], [amarela, azul, preta, verde, vermelha]),
    permutation([N0, N1, N2, N3, N4], [ana, jessica, joana, pati, renata]),
    permutation([Mat0, Mat1, Mat2, Mat3, Mat4], [artes, biologia, historia, matematica, portugues]),
    permutation([A0, A1, A2, A3, A4], [cachorros, cavalos, gatos, hamsters, passaros]),
    permutation([C0, C1, C2, C3, C4], [noronha, florianopolis, recife, rio, salvador]),
    permutation([S0, S1, S2, S3, S4], [abacaxi, laranja, limao, maracuja, morango]).
