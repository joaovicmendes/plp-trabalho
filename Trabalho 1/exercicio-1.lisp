;; Exercício 1:
;; Dada uma lista L que contém elementos de qualquer tipo, possivelmente com
;; repetições, construir outra lista que mostre quantas vezes cada elemento atômico
;; (átomo, número, lista vazia) aparece na lista dada, inclusive nas sublistas.
;; A lista resultante deve conter pares de elementos (pares são listas de dois
;; elementos) sendo o primeiro elemento do par um elemento atômico que aparece
;; na lista dada e o segundo elemento do par, o número de vezes que esse elemento
;; aparece na lista. A ordem dos elementos na lista original deve ser mantida.
;; - Por exemplo, dada a lista L = (a b z x 4.6 (a x) () (5 z x) ())
;; - Deve ser construída a lista ((a 2) (b 1) (z 2) (x 3) (4.6 1) (() 2) (5 1) )

;; Função auxiliar que traz elementos de listas aninhadas para o primeiro nível
;; ex: (squash '(A B (C (D)) E (F))) -> (A B C D E F)
(defun squash (list) 
    (cond   
        ((null list) nil)
        ((atom list) (list list))
        (t (append (squash (car list)) (squash (cdr list))))
    )
)

;; Função auxiliar que atualiza a frência de um elemento em uma lista de frequências
;; ex: (update-frequency 'B '((A 1) (B 2) (C 3))) -> ((A 1) (B 3) (C 3))
(defun update-frequency (element freq-list) 
    (cond   
        ((null freq-list) (list (list element 1))) ;; se a lista é vazia, elemento ainda não existe, então adicione com frequência 1
        ((eq element (caar freq-list)) ;; se o primeiro elemento é o que queremos atualizar, incrementa sua frequência
            (let*
                ((frequency (cadr (car freq-list))))
                (cons (list element (+ frequency 1)) (cdr freq-list)))) 
        (t (cons (car freq-list) (update-frequency element (cdr freq-list)))) ;; se não é o primeiro, procura no resto da lista
    )
)

;; Função que realiza o cálculo da frequência. Atualiza a frequência do elemento atual e calcula da cauda recursivamente.
;; Essa ordem na operação (atualiza com o atual para depois chamar recursivo) é necessária para manter a ordem dos elementos.
;; Alternativamente, deveriamos retornar a lista final invertida
;; ex: (count-element-frequency-internal '(A A B C C D) '()) -> ((A 2) (B 1) (C 2) (D 1))
(defun count-element-frequency-internal (list freq-list)
    (cond
        ((null list) freq-list)
        (t (let*
            ((updated-list (update-frequency (car list) freq-list )))
            (count-element-frequency-internal (cdr list) updated-list)
        ))
    )
)

;; Função que encapsula funções anteriores
;; ex: (count-element-frequency '(a b (a b c) d ((e d ) f))) -> ((A 2) (B 2) (C 1) (D 2) (E 1) (F 1))
(defun count-element-frequency (list)
    (count-element-frequency-internal (squash list) '()))
