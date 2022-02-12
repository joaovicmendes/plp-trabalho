; Exercício 1 ;
(defun substitui (L)
    (cond
    ((null L) nil)
    ((numberp (car L)) (append (list 0) (substitui (cdr L))))
    (t (cons (append (car L)) (substitui (cdr L))))))

; Exercício 3 ;
(defun esta_seguido (Lista E1 E2)
    (cond
        ((null Lista) nil)
        ((and 
            (eq E1 (car Lista))
            (eq E2 (car (cdr Lista)))) t)
        (t (esta_seguido (cdr Lista) E1 E2))))

(defun indice (Lista Elemento)
    (cond 
        ((null Lista) nil)
        ((eq Elemento (car Lista)) 0)
        (t 
            (let* 
                ((resultado (indice (cdr Lista) Elemento)))
                (cond 
                    ((eq resultado nil) nil) ; erro, não existe elemento
                    (t (+ resultado 1))) ; retorna a posição encontrada + 1
            )
        )))

(defun resolve_exercicio (L E1 E2)
    (cond
        ((esta_seguido L E1 E2) (indice L E1))
        (t nil)))
