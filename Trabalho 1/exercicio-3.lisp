;; Exercício 3:
;; Uma árvore binária é uma estrutura de dados e pode ser representada no formato
;; de uma lista. Um exemplo é a lista (A (B( ) C( ))) que tem o no raiz A e os
;; filhos B e C da esquerda e direita respectivamente e estes não possuem descendentes.
;; Faca um programa em lisp que, dada uma árvore binária representada por uma lista,
;; retorne uma lista com o percurso natural.
;; - (percurso-natural '(A (B ( ) C ( ) ) ) ) 
;; - (B A C)

(defun percurso-natural (root) 
    (cond
        ((null root) nil)
        (t (let*
                (
                    (curr-node (car root)) ;; salva o elemento raíz
                    (left-tree (percurso-natural (cadr root))) ;; visita subárvore esquerda
                    (right-tree (percurso-natural (cdr (cdr (cadr root))))) ;; visita subárvore direita
                )
                (append left-tree (cons curr-node right-tree)))))) ;; retorna (subárvore-esq raíz subárvore-dir)

;; Exemplos
(percurso-natural '(A (B () C ()))) ;; esperado: (B A C)
(percurso-natural '(A (B (E () F ()) C (G ())))) ;; esperado: (E B F A G C)
(percurso-natural '(A (B (E () F ()) C (() () G ())))) ;; esperado: (E B F A NIL C G)
