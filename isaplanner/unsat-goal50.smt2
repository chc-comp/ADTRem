; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_new1 (listOfInt listOfInt Bool) Bool)
(declare-fun last (listOfInt Int) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun take (Int listOfInt listOfInt) Bool)
(declare-fun minus (Int Int Int) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun butlast (listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) )
    (last (conslistOfInt A nillistOfInt) A)
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Int) )
    (=>
      (last (conslistOfInt B C) D)
      (last (conslistOfInt A (conslistOfInt B C)) D)
    )
  )
)
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
  (forall ( (A Int) (B Int) (C Int) )
    (=>
      (and
        (= C 0)
        (>= A 0)
        (>= (- B A) 1)
      )
      (minus A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) )
    (=>
      (and
        (= C (- A B))
        (<= B A)
        (>= A 0)
      )
      (minus A B C)
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
    (butlast nillistOfInt nillistOfInt)
)
(assert
  (forall ( (A Int) )
    (butlast (conslistOfInt A nillistOfInt) nillistOfInt)
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) )
    (=>
      (butlast (conslistOfInt B C) D)
      (butlast (conslistOfInt A (conslistOfInt B C)) (conslistOfInt A D))
    )
  )
)
(assert
  (forall ( (A Bool) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) (G listOfInt) )
    (=>
      (and
        (= A true)
        (= B 1)
        (= C (- D B))
        (>= C 0)
        (butlast E F)
        (len E D)
        (take C E G)
        (adt_new1 F G A)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Bool) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) (G listOfInt) )
    (=>
      (and
        (= A true)
        (= B 1)
        (= C 0)
        (<= D (- B 1))
        (butlast E F)
        (len E D)
        (take C E G)
        (adt_new1 F G A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
