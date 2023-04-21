; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_new1 (listOfInt listOfInt Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun map_not (Bool Bool) Bool)
(declare-fun butlast (listOfInt listOfInt) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun last (listOfInt Int) Bool)
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
  (forall ( (A Bool) (B Bool) )
    (=>
      (and
        (= B false)
        (= A true)
      )
      (map_not A B)
    )
  )
)
(assert
  (forall ( (A Bool) (B Bool) )
    (=>
      (and
        (= B true)
        (= A false)
      )
      (map_not A B)
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
      (butlast (conslistOfInt A C) D)
      (butlast (conslistOfInt A (conslistOfInt B C)) (conslistOfInt B D))
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
  (forall ( (A Bool) (B Int) (C listOfInt) (D Int) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (= A false)
        (last (conslistOfInt B C) D)
        (append (conslistOfInt B C) (conslistOfInt D nillistOfInt) E)
        (butlast E F)
        (adt_new1 (conslistOfInt B C) F A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
