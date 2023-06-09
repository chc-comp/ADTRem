; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun f (Int Int) Bool)
(declare-fun p (Int Bool) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun filter (listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) (B Int) )
    (=>
      (= A (+ (- 1) B))
      (f A B)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) )
    (=>
      (and
        (= B true)
        (>= A 1)
      )
      (p A B)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) )
    (=>
      (and
        (= B false)
        (<= A 0)
      )
      (p A B)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (= C true)
        (>= A 0)
        (>= (- B A) 1)
      )
      (less A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (= C false)
        (<= (- B A) 0)
        (>= B 0)
      )
      (less A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (= C true)
        (>= A 0)
        (<= A B)
      )
      (leq A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (= C false)
        (>= A (+ B 1))
        (>= B 0)
      )
      (leq A B C)
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
    (filter nillistOfInt nillistOfInt)
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D true)
        (p A D)
        (filter B C)
      )
      (filter (conslistOfInt A B) (conslistOfInt A C))
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D false)
        (p A D)
        (filter B C)
      )
      (filter (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (<= A B)
        (filter C D)
        (len D A)
        (len C B)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
