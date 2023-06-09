; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun rev (listOfInt listOfInt) Bool)
(declare-fun count (Int listOfInt Int) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A listOfInt) )
    (append nillistOfInt A A)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D listOfInt) )
    (=>
      (append B C D)
      (append (conslistOfInt A B) C (conslistOfInt A D))
    )
  )
)
(assert
    (rev nillistOfInt nillistOfInt)
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (rev B D)
        (append D (conslistOfInt A nillistOfInt) C)
      )
      (rev (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) )
    (=>
      (= B 0)
      (count A nillistOfInt B)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Int) (D Int) )
    (=>
      (and
        (= C (+ 1 D))
        (count A B D)
      )
      (count A (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Int) )
    (=>
      (and
        (>= (- B A) 1)
        (count A C D)
      )
      (count A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Int) )
    (=>
      (and
        (<= (- B A) (- 1))
        (count A C D)
      )
      (count A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) (D listOfInt) (E listOfInt) )
    (=>
      (and
        (>= (- A B) 1)
        (count C D B)
        (rev D E)
        (count C E A)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) (D listOfInt) (E listOfInt) )
    (=>
      (and
        (<= (- A B) (- 1))
        (count C D B)
        (rev D E)
        (count C E A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
