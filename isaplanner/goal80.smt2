; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun insort (Int listOfInt listOfInt) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun sorted (listOfInt Bool) Bool)
(declare-fun sort (listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) )
    (insort A nillistOfInt (conslistOfInt A nillistOfInt))
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) )
    (=>
      (<= A (- B 1))
      (insort A (conslistOfInt B C) (conslistOfInt A (conslistOfInt B C)))
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (>= A B)
        (insort A C D)
      )
      (insort A (conslistOfInt B C) (conslistOfInt B D))
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
  (forall ( (A Bool) )
    (=>
      (= A true)
      (sorted nillistOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) )
    (=>
      (= B true)
      (sorted (conslistOfInt A nillistOfInt) B)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D false)
        (>= A (+ B 1))
      )
      (sorted (conslistOfInt A (conslistOfInt B C)) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (<= A B)
        (sorted (conslistOfInt B C) D)
      )
      (sorted (conslistOfInt A (conslistOfInt B C)) D)
    )
  )
)
(assert
    (sort nillistOfInt nillistOfInt)
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (sort B D)
        (insort A D C)
      )
      (sort (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Bool) (B listOfInt) (C listOfInt) )
    (=>
      (and
        (= A false)
        (sort B C)
        (sorted C A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)