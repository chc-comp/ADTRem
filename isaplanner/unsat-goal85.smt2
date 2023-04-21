; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((pairOfIntInt 0) )
  (((pair-pairOfIntInt (fst-pairOfIntInt Int) (snd-pairOfIntInt Int)) )))
(declare-datatypes ((listOfpairOfIntInt 0) )
(((cons-listOfpairOfIntInt (head-listOfpairOfIntInt pairOfIntInt) (tail-listOfpairOfIntInt listOfpairOfIntInt)) (nil-listOfpairOfIntInt))))
(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun adt_eqlistpairs (listOfpairOfIntInt listOfpairOfIntInt Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun zappend (listOfpairOfIntInt listOfpairOfIntInt listOfpairOfIntInt) Bool)
(declare-fun drop (Int listOfInt listOfInt) Bool)
(declare-fun take (Int listOfInt listOfInt) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun zip (listOfInt listOfInt listOfpairOfIntInt) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Bool) )
    (=>
      (= A true)
      (adt_eqlistpairs nil-listOfpairOfIntInt nil-listOfpairOfIntInt A)
    )
  )
)
(assert
  (forall ( (A pairOfIntInt) (B listOfpairOfIntInt) (C Bool) )
    (=>
      (= C false)
      (adt_eqlistpairs nil-listOfpairOfIntInt (cons-listOfpairOfIntInt A B) C)
    )
  )
)
(assert
  (forall ( (A pairOfIntInt) (B listOfpairOfIntInt) (C Bool) )
    (=>
      (= C false)
      (adt_eqlistpairs (cons-listOfpairOfIntInt A B) nil-listOfpairOfIntInt C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfpairOfIntInt) (D Int) (E Int) (F listOfpairOfIntInt) (G Bool) )
    (=>
      (and
        (= G false)
        (>= A (+ D 1))
      )
      (adt_eqlistpairs (cons-listOfpairOfIntInt (pair-pairOfIntInt A B) C) (cons-listOfpairOfIntInt (pair-pairOfIntInt D E) F) G)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfpairOfIntInt) (D Int) (E Int) (F listOfpairOfIntInt) (G Bool) )
    (=>
      (and
        (= G false)
        (<= A (- D 1))
      )
      (adt_eqlistpairs (cons-listOfpairOfIntInt (pair-pairOfIntInt A B) C) (cons-listOfpairOfIntInt (pair-pairOfIntInt D E) F) G)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfpairOfIntInt) (D Int) (E Int) (F listOfpairOfIntInt) (G Bool) )
    (=>
      (and
        (= G false)
        (>= B (+ E 1))
      )
      (adt_eqlistpairs (cons-listOfpairOfIntInt (pair-pairOfIntInt A B) C) (cons-listOfpairOfIntInt (pair-pairOfIntInt D E) F) G)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfpairOfIntInt) (D Int) (E Int) (F listOfpairOfIntInt) (G Bool) )
    (=>
      (and
        (= G false)
        (<= B (- E 1))
      )
      (adt_eqlistpairs (cons-listOfpairOfIntInt (pair-pairOfIntInt A B) C) (cons-listOfpairOfIntInt (pair-pairOfIntInt D E) F) G)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfpairOfIntInt) (D listOfpairOfIntInt) (E Bool) )
    (=>
      (adt_eqlistpairs C D E)
      (adt_eqlistpairs (cons-listOfpairOfIntInt (pair-pairOfIntInt A B) C) (cons-listOfpairOfIntInt (pair-pairOfIntInt A B) D) E)
    )
  )
)
(assert
  (forall ( (A listOfpairOfIntInt) )
    (zappend nil-listOfpairOfIntInt A A)
  )
)
(assert
  (forall ( (A pairOfIntInt) (B listOfpairOfIntInt) (C listOfpairOfIntInt) (D listOfpairOfIntInt) )
    (=>
      (zappend B C D)
      (zappend (cons-listOfpairOfIntInt A B) C (cons-listOfpairOfIntInt A D))
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
  (forall ( (A Bool) (B listOfInt) (C listOfInt) (D listOfInt) (E listOfInt) (F listOfpairOfIntInt) (G Int) (H listOfInt) (I listOfpairOfIntInt) (J listOfInt) (K listOfpairOfIntInt) (L listOfpairOfIntInt) )
    (=>
      (and
        (= A true)
        (append B C D)
        (zip D E F)
        (len B G)
        (take G E H)
        (zip B H I)
        (drop G E J)
        (zip C J K)
        (zappend I K L)
        (adt_eqlistpairs F L A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
