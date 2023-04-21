; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))
(declare-datatypes ((queueOfInt 0) )
(((queuequeueOfInt (frontqueueOfInt listOfInt) (backqueueOfInt listOfInt)) )))



(declare-fun adt_new1 (listOfInt listOfInt Bool) Bool)
(declare-fun qreva (listOfInt listOfInt listOfInt) Bool)
(declare-fun queuetolst (queueOfInt listOfInt) Bool)
(declare-fun qrev (listOfInt listOfInt) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun qlen (queueOfInt Int) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun plus (Int Int Int) Bool)
(declare-fun isamortized (queueOfInt Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun amortizequeue (listOfInt listOfInt queueOfInt) Bool)
(declare-fun enqueue (queueOfInt Int queueOfInt) Bool)
(declare-fun butlast (listOfInt listOfInt) Bool)
(declare-fun qpop (queueOfInt queueOfInt) Bool)
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
  (forall ( (A listOfInt) )
    (qreva nillistOfInt A A)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) (D listOfInt) )
    (=>
      (qreva B (conslistOfInt A C) D)
      (qreva (conslistOfInt A B) C D)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (qrev B D)
        (append A D C)
      )
      (queuetolst (queuequeueOfInt A B)  C)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C Int) (D Int) (E Int) )
    (=>
      (and
        (len A D)
        (len B E)
        (plus D E C)
      )
      (qlen (queuequeueOfInt A B)  C)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C Bool) (D Int) (E Int) )
    (=>
      (and
        (len B D)
        (len A E)
        (leq D E C)
      )
      (isamortized (queuequeueOfInt A B)  C)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) )
    (=>
      (qreva A nillistOfInt B)
      (qrev A B)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C Bool) (D Int) (E Int) )
    (=>
      (and
        (= C true)
        (leq D E C)
        (len A E)
        (len B D)
      )
      (amortizequeue A B (queuequeueOfInt A B) )
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C listOfInt) (D Bool) (E Int) (F Int) (G listOfInt) )
    (=>
      (and
        (= D false)
        (leq E F D)
        (len A F)
        (len B E)
        (append A G C)
        (qrev B G)
      )
      (amortizequeue A B (queuequeueOfInt C nillistOfInt) )
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C Int) (D queueOfInt) )
    (=>
      (amortizequeue A (conslistOfInt C B) D)
      (enqueue (queuequeueOfInt A B)  C D)
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
  (forall ( (A listOfInt) (B Int) (C listOfInt) )
    (qpop (queuequeueOfInt A (conslistOfInt B C))  (queuequeueOfInt A C) )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) )
    (=>
      (butlast A B)
      (qpop (queuequeueOfInt A nillistOfInt)  (queuequeueOfInt B nillistOfInt) )
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
  (forall ( (A Int) (B Int) (C Int) )
    (=>
      (and
        (= C (+ A B))
        (>= A 0)
        (>= B 0)
      )
      (plus A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (<= A B)
        (= C true)
      )
      (leq A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (>= A (+ B 1))
        (= C false)
      )
      (leq A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (<= A (- B 1))
        (= C true)
      )
      (less A B C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (>= A B)
        (= C false)
      )
      (less A B C)
    )
  )
)
(assert
  (forall ( (A Bool) (B listOfInt) (C listOfInt) (D listOfInt) (E Int) (F listOfInt) (G queueOfInt) (H listOfInt) )
    (=>
      (and
        (= A false)
        (queuetolst (queuequeueOfInt B C)  D)
        (append D (conslistOfInt E nillistOfInt) F)
        (enqueue (queuequeueOfInt B C)  E G)
        (queuetolst G H)
        (adt_new1 F H A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
