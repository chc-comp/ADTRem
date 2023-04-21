; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun leq (Int Int Bool) Bool)
(declare-fun map_not (Bool Bool) Bool)
(declare-fun count (Int listOfInt Int) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

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
  (forall ( (A Int) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (>= (- A B) 1)
        (>= (- C D) 1)
        (append E (conslistOfInt D nillistOfInt) F)
        (count C F B)
        (count C E A)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (<= (- A B) (- 1))
        (>= (- C D) 1)
        (append E (conslistOfInt D nillistOfInt) F)
        (count C F B)
        (count C E A)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (>= (- A B) 1)
        (<= (- C D) (- 1))
        (append E (conslistOfInt D nillistOfInt) F)
        (count C F B)
        (count C E A)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Int) (D Int) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (<= (- A B) (- 1))
        (<= (- C D) (- 1))
        (append E (conslistOfInt D nillistOfInt) F)
        (count C F B)
        (count C E A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)