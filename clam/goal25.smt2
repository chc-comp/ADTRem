; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun map_not (Bool Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun plus (Int Int Int) Bool)
(declare-fun even (Int Bool) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) (B Bool) (C Int) )
    (=>
      (and
        (= A (* 2 C))
        (= B true)
      )
      (even A B)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) (C Int) )
    (=>
      (and
        (= A (+ (* 2 C) 1))
        (= B false)
      )
      (even A B)
    )
  )
)
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
  (forall ( (A Int) (B Int) (C Int) (D Int) (E Int) (F Int) (G listOfInt) (H listOfInt) (I listOfInt) )
    (=>
      (and
        (= A (* 2 B))
        (= C (+ (* 2 D) 1))
        (= (+ E F) C)
        (append G H I)
        (len I A)
        (len G E)
        (len H F)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) (D Int) (E Int) (F Int) (G listOfInt) (H listOfInt) (I listOfInt) )
    (=>
      (and
        (= A (+ (* 2 B) 1))
        (= C (* 2 D))
        (= (+ E F) C)
        (append G H I)
        (len I A)
        (len G E)
        (len H F)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)