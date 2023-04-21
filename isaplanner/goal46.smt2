; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((pairOfIntInt 0) )
  (((pair-pairOfIntInt (fst-pairOfIntInt Int) (snd-pairOfIntInt Int)) )))
(declare-datatypes ((listOfpairOfIntInt 0) )
(((cons-listOfpairOfIntInt (head-listOfpairOfIntInt pairOfIntInt) (tail-listOfpairOfIntInt listOfpairOfIntInt)) (nil-listOfpairOfIntInt))))
(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_new1 (listOfpairOfIntInt Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun zip (listOfInt listOfInt listOfpairOfIntInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A pairOfIntInt) (B listOfpairOfIntInt) (C Bool) )
    (=>
      (= C false)
      (adt_new1 (cons-listOfpairOfIntInt A B) C)
    )
  )
)
(assert
  (forall ( (A Bool) )
    (=>
      (= A true)
      (adt_new1 nil-listOfpairOfIntInt A)
    )
  )
)
(assert
  (forall ( (A listOfInt) )
    (zip nillistOfInt A nil-listOfpairOfIntInt)
  )
)
(assert
  (forall ( (A listOfInt) )
    (zip A nillistOfInt nil-listOfpairOfIntInt)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Int) (D listOfInt) (E listOfpairOfIntInt) )
    (=>
      (zip B D E)
      (zip (conslistOfInt A B) (conslistOfInt C D) (cons-listOfpairOfIntInt (pair-pairOfIntInt A C) E))
    )
  )
)
(assert
  (forall ( (A listOfInt) (B pairOfIntInt) (C listOfpairOfIntInt) )
    (=>
      (zip nillistOfInt A (cons-listOfpairOfIntInt B C))
      ff
    )
  )
)

(assert (not ff))
(check-sat)