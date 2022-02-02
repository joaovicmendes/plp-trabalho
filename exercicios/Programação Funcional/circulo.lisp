;; Defina CIRCULO tal que retorne uma lista com a circunferência e a área de um
;; círculo, dado o raio deste círculo. Assuma que PI é uma variável livre com o
;; valor apropriado.

(setq PI 3.14)

(defun circulo (raio)
    (list 
        (* 2 PI raio)
        (* PI (* raio raio))))
