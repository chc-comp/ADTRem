; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_new1 (listOfInt listOfInt Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun drop (Int listOfInt listOfInt) Bool)
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
  (forall ( (A Bool) (B Int) (C Int) (D Int) (E Int) (F Int) (G listOfInt) (H listOfInt) (I listOfInt) (J listOfInt) (K listOfInt) )
    (=>
      (and
        (= A false)
        (= B (+ 1 C))
        (>= C 0)
        (>= D 1)
        (drop B (conslistOfInt E (conslistOfInt F G)) H)
        (drop D H I)
        (drop C (conslistOfInt E G) J)
        (drop D J K)
        (adt_new1 I K A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
