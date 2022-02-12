;; Defina um predicado TRI-RETAN, que recebe três argumentos. Os três argumentos
;; são os comprimentos dos lados de um triângulo, que pode ser um triângulo
;; retângulo. TRI-RETAN deve retornar T se a soma dos quadrados dos dois lados
;; menores está a menos de 2% do quadrado do lado maior. Caso contrário, TRI-RETAN
;; deve retornar NIL. Assuma que o lado maior é dado como o primeiro argumento.

(defun tri-retan (x y z)
    (let* 
        ((somaQuadrados (+ (* y y) (* z z)))
        (quadradoMaior (* x x))
        (doisPorcento (* quadradoMaior 0.02)))
        (cond
            ((< (abs (- quadradoMaior somaQuadrados)) doisPorcento) t)
            (t nil))
    )
)
