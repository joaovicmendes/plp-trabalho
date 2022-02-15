;; Exercício 3:
;; Uma árvore binária é uma estrutura de dados e pode ser representada no formato
;; de uma lista. Um exemplo é a lista (A (B( ) C( ))) que tem o no raiz A e os
;; filhos B e C da esquerda e direita respectivamente e estes não possuem descendentes.
;; Faca um programa em lisp que, dada uma árvore binária representada por uma lista,
;; retorne uma lista com o percurso natural.
;; - (percurso_natural '(A (B ( ) C ( ) ) ) ) 
;; - (B A C)

(defun percurso_natural (root) 
    (cond
        ((null root) nil)
        (t (let*
                (
                    (curr_node (car root)) ;; salva o elemento raíz
                    (left_tree (percurso_natural (cadr root))) ;; visita subárvore esquerda
                    (right_tree (percurso_natural (cdr (cdr (cadr root))))) ;; visita subárvore direita
                )
                (append left_tree (cons curr_node right_tree)))))) ;; retorna (subárvore_esq raíz subárvore_dir)

;; Exemplos
(percurso_natural '(A (B () C ()))) ;; esperado: (B A C)
(percurso_natural '(A (B (E () F ()) C (G ())))) ;; esperado: (E B F A G C)
(percurso_natural '(A (B (E () F ()) C (() () G ())))) ;; esperado: (E B F A NIL C G)
