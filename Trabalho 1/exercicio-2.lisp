;; Exercício 2:
;; Dada uma lista L com elementos numéricos, ordenar a lista em ordem crescente.
;; Se um número aparecer mais de uma vez, as repetições devem ser mantidas no resultado.

;; Função que recebe uma lista e um elemento, e insere esse elemento na lista ao encontrar um
;; elemento >= que ele mesmo
;; ex: (insere-ordenado 5 '(1 2 3 7 8)) -> (1 2 3 5 7 8)
(defun insere-ordenado (elemento lista) 
    (cond
        ((null lista) (list elemento))
        ((>= (car lista) elemento) (cons elemento lista))
        (t (cons (car lista) (insere-ordenado elemento (cdr lista))))
    )
)

;; Função que encapsula a chamada para a função ordena
;; Para cada elemento da lista, insere ordenado em uma lista auxiliar
;; ex: (ordena-auxiliar '(9 8 7 6 5 4 3 2 1) '()) -> (1 2 3 4 5 6 7 8 9)
(defun ordena-auxiliar (lista lista-ordenada)
    (cond
        ((null lista) lista-ordenada)
        (t (insere-ordenado (car lista) (ordena-auxiliar (cdr lista) lista-ordenada)))
    )
)

;; Função que ordena uma lista de números em ordem crescente
;; ex: (ordena '(1 3 2 2)) -> (1 2 2 3)
(defun ordena (lista) 
    (ordena-auxiliar lista '())
)
