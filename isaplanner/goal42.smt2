; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_new1 (listOfInt listOfInt Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun take (Int listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) (B listOfInt) (C Bool) )
    (=>
      (= C false)
      (adt_new1 nillistOfInt (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Bool) )
    (=>
      (= C false)
      (adt_new1 (conslistOfInt A B) nillistOfInt C)
    )
  )
)
(assert
  (forall ( (A Bool) )
    (=>
      (= A true)
      (adt_new1 nillistOfInt nillistOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Int) (D listOfInt) (E Bool) )
    (=>
      (and
        (= E false)
        (>= (- C A) 1)
      )
      (adt_new1 (conslistOfInt A B) (conslistOfInt C D) E)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Int) (D listOfInt) (E Bool) )
    (=>
      (and
        (= E false)
        (<= (- C A) (- 1))
      )
      (adt_new1 (conslistOfInt A B) (conslistOfInt C D) E)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D Bool) )
    (=>
      (adt_new1 B C D)
      (adt_new1 (conslistOfInt A B) (conslistOfInt A C) D)
    )
  )
)
(assert
  (forall ( (A Int) )
    (take A nillistOfInt nillistOfInt)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) )
    (=>
      (= A 0)
      (take A B nillistOfInt)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) (E Int) )
    (=>
      (and
        (= A (+ 1 E))
        (>= E 0)
        (take E C D)
      )
      (take A (conslistOfInt B C) (conslistOfInt B D))
    )
  )
)
(assert
  (forall ( (A Bool) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) (G listOfInt) )
    (=>
      (and
        (= A false)
        (= B (+ 1 C))
        (>= C 0)
        (take B (conslistOfInt D E) F)
        (take C E G)
        (adt_new1 F (conslistOfInt D G) A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
