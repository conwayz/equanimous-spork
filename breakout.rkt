(require 2htdp/image)
(require 2htdp/universe)
(require "struct-inheritance.rkt")


;;;turnable constants

(define window-width 800)
(define window-height 600)
(define frame-rate 30)
(define inter-frame-interval (/ 1.0 frame-rate))

;;; definitions

(define-struct game-object
  ([position #:mutable])
  #:methods
  (define (update! object)
    (void)))

(define-struct (player game-object)
  ([velocity #:mutable]))

(define-struct (ball game-object)
  ([velocity #:mutable]))

(define-struct (block game-object)
  (color))


;;; tracking game objects

(define all-game-objects '())

(define (destroy! object)
  (set! all-game-objects
        (remove object all-game-objects)))

(define (add-game-object! object)
  (cons object all-game-objects))

;;; event dispatch

(define (on-key-press key)
  (cond;[(equal? key "left")
        ;(change some velocity of player)]
        ;[(equal? key "right")
         ;(change some velociity of player)]
    [else null]))

(define (on-key-press key)
  (cond;[(equal? key "left")
        ;(set velocity of player = 0)]
        ;[(equal? key "right")
         ;(set velocity of player = 0)]
    [else null]))

;;; randomization

(define random-color
  (local [(define colors
            (list (color 255 0 0)
                  (color 0 255 0)
                  (color 0 0 255)
                  (color 128 128 0)
                  (color 128 0 129)
                  (color 0 128 128)))]
    (λ () (random-element colors))))

(define (random-element list)
  (list-ref list
            (random (length list))))

       

