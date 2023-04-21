; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_equals (listOfInt listOfInt Bool) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun plus (Int Int Int) Bool)
(declare-fun rotate (Int listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) )
    (=>
      (= A 0)
      (len nillistOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Int) (D Int) )
    (=>
      (and
        (= C (+ 1 D))
        (len B D)
      )
      (len (conslistOfInt A B) C)
    )
  )
)
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
  (forall ( (A Int) (B Int) (C Int) )
    (=>
      (and
        (= B (- C A))
        (>= A 0)
        (>= (- C A) 0)
      )
      (plus A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) )
    (=>
      (= A 0)
      (rotate A B B)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) )
    (=>
      (and
        (= A (+ 1 B))
        (>= B 0)
      )
      (rotate A nillistOfInt nillistOfInt)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) (E Int) (F listOfInt) )
    (=>
      (and
        (= A (+ 1 E))
        (>= E 0)
        (append C (conslistOfInt B nillistOfInt) F)
        (rotate E F D)
      )
      (rotate A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Bool) )
    (=>
      (= C false)
      (adt_equals nillistOfInt (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Bool) )
    (=>
      (= C false)
      (adt_equals (conslistOfInt A B) nillistOfInt C)
    )
  )
)
(assert
  (forall ( (A Bool) )
    (=>
      (= A true)
      (adt_equals nillistOfInt nillistOfInt A)
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
      (adt_equals (conslistOfInt A B) (conslistOfInt C D) E)
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
      (adt_equals (conslistOfInt A B) (conslistOfInt C D) E)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D Bool) )
    (=>
      (adt_equals B C D)
      (adt_equals (conslistOfInt A B) (conslistOfInt A C) D)
    )
  )
)
(assert
  (forall ( (A Bool) (B Int) (C Int) (D listOfInt) (E listOfInt) (F listOfInt) (G listOfInt) (H listOfInt) )
    (=>
      (and
        (= A false)
        (>= B 0)
        (>= C 0)
        (rotate C D E)
        (rotate B E F)
        (rotate B D G)
        (rotate C G H)
        (adt_equals F H A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
