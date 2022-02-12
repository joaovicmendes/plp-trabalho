;; Um palíndromo é uma lista que tem a mesma sequência de elementos quando é lida
;; tanto da esquerda para a direita quanto da direita para a esquerda. Defina uma
;; função em LISP de nome PALINDROMIZE, que recebe uma lista como seu argumento e
;; retorna um palíndromo com o dobro do comprimento. Defina também uma função
;; auxiliar REVERSA, que recebe uma lista e retorna outra com os elementos em ordem
;; inversa. (O interpretador LISP tem uma função pré-definida chamada REVERSE, que
;; não deve ser usada neste exercício).

(defun reversa (x)
    (cond
        ((null x) x)
        (T (append 
            (reversa (cdr x))
            (list (car x))))))

(defun palindromize (x)
    (append x (reversa x)))


;; Defina um predicado PALINDROMOP, que testa seu argumento para ver se é um palindromo.
;; Se o argumento for um átomo, a resposta deve ser NIL.

(defun compara (x y) 
    (cond
        ((and (null x) (null y) t))
        ((null x) nil)
        ((null y) nil)
        ((or (atom x) (atom y)) nil)
        ((equal (car x) (car y)) 
            (compara (cdr x) (cdr y)))))

(defun palindromop (x) 
    (cond
        ((atom x) nil)
        ((compara x (reversa x)))))
