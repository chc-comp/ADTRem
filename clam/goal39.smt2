; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun leq (Int Int Bool) Bool)
(declare-fun drop (Int listOfInt listOfInt) Bool)
(declare-fun mem (Int listOfInt Bool) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) )
    (drop A nillistOfInt nillistOfInt)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) )
    (=>
      (= A 0)
      (drop A B B)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) (E Int) )
    (=>
      (and
        (= A (+ 1 E))
        (>= E 0)
        (drop E C D)
      )
      (drop A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) )
    (=>
      (= B false)
      (mem A nillistOfInt B)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Bool) )
    (=>
      (= C true)
      (mem A (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D true)
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D false)
        (>= (- B A) 1)
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D false)
        (<= (- B A) (- 1))
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Bool) (B Bool) (C Int) (D Int) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (= A true)
        (= A true)
        (= A true)
        (= B false)
        (= A true)
        (>= C 0)
        (mem D E B)
        (mem D F A)
        (drop C E F)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
