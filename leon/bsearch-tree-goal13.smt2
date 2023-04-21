; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))
(declare-datatypes ((treeOfInt 0) )
(((nodetreeOfInt (datatreeOfInt Int) (lefttreeOfInt treeOfInt) (righttreeOfInt treeOfInt)) (leaftreeOfInt))))



(declare-fun adt_equaltrees (treeOfInt treeOfInt Bool) Bool)
(declare-fun len (listOfInt Int) Bool)
(declare-fun mem (Int listOfInt Bool) Bool)
(declare-fun nmax (Int Int Int) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun height (treeOfInt Int) Bool)
(declare-fun tinsertall (treeOfInt listOfInt treeOfInt) Bool)
(declare-fun tinsert (treeOfInt Int treeOfInt) Bool)
(declare-fun plus (Int Int Int) Bool)
(declare-fun tremove (treeOfInt Int treeOfInt) Bool)
(declare-fun tremoveall (treeOfInt listOfInt treeOfInt) Bool)
(declare-fun tcontains (treeOfInt Int Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun tmember (treeOfInt Int Bool) Bool)
(declare-fun append (listOfInt listOfInt listOfInt) Bool)
(declare-fun content (treeOfInt listOfInt) Bool)
(declare-fun tsize (treeOfInt Int) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Bool) )
    (=>
      (= A true)
      (adt_equaltrees leaftreeOfInt leaftreeOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Bool) )
    (=>
      (= D false)
      (adt_equaltrees leaftreeOfInt (nodetreeOfInt A B C)  D)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Bool) )
    (=>
      (= D false)
      (adt_equaltrees (nodetreeOfInt A B C)  leaftreeOfInt D)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E treeOfInt) (F treeOfInt) (G Bool) )
    (=>
      (and
        (= G false)
        (not (= A D))
      )
      (adt_equaltrees (nodetreeOfInt A B C)  (nodetreeOfInt D E F)  G)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D treeOfInt) (E treeOfInt) (F Bool) )
    (=>
      (and
        (= F false)
        (adt_equaltrees B D F)
      )
      (adt_equaltrees (nodetreeOfInt A B C)  (nodetreeOfInt A D E)  F)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D treeOfInt) (E treeOfInt) (F Bool) )
    (=>
      (and
        (= F false)
        (adt_equaltrees C E F)
      )
      (adt_equaltrees (nodetreeOfInt A B C)  (nodetreeOfInt A D E)  F)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D treeOfInt) (E treeOfInt) (F Bool) )
    (=>
      (and
        (= F true)
        (adt_equaltrees B D F)
        (adt_equaltrees C E F)
      )
      (adt_equaltrees (nodetreeOfInt A B C)  (nodetreeOfInt A D E)  F)
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
  (forall ( (A Int) (B Bool) )
    (=>
      (= B false)
      (mem A nillistOfInt B)
    )
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C Bool) )
    (=>
      (= C true)
      (mem A (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D true)
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D false)
        (>= (- B A) 1)
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D Bool) )
    (=>
      (and
        (= D false)
        (<= (- B A) (- 1))
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (= C true)
        (less A B C)
      )
      (nmax A B B)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C Bool) )
    (=>
      (and
        (= C false)
        (less A B C)
      )
      (nmax A B A)
    )
  )
)
(assert
  (forall ( (A Int) )
    (=>
      (= A 0)
      (height leaftreeOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Int) (F Int) (G Int) )
    (=>
      (and
        (= D (+ 1 E))
        (height B F)
        (height C G)
        (nmax F G E)
      )
      (height (nodetreeOfInt A B C)  D)
    )
  )
)
(assert
  (forall ( (A treeOfInt) )
    (tinsertall A nillistOfInt A)
  )
)
(assert
  (forall ( (A treeOfInt) (B Int) (C listOfInt) (D treeOfInt) (E treeOfInt) )
    (=>
      (and
        (tinsertall A C E)
        (tinsert E B D)
      )
      (tinsertall A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) )
    (tremove leaftreeOfInt A leaftreeOfInt)
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E treeOfInt) )
    (=>
      (and
        (<= D (- A 1))
        (tremove B D E)
      )
      (tremove (nodetreeOfInt A B C)  D (nodetreeOfInt A E C) )
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E treeOfInt) )
    (=>
      (and
        (<= A (- D 1))
        (tremove C D E)
      )
      (tremove (nodetreeOfInt A B C)  D (nodetreeOfInt A B E) )
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) )
    (tremove (nodetreeOfInt A leaftreeOfInt B)  A B)
  )
)
(assert
  (forall ( (A Int) (B Int) (C treeOfInt) (D treeOfInt) (E treeOfInt) (F treeOfInt) )
    (=>
      (tremove (nodetreeOfInt B C D)  B F)
      (tremove (nodetreeOfInt A (nodetreeOfInt B C D)  E)  A (nodetreeOfInt B F E) )
    )
  )
)
(assert
  (forall ( (A treeOfInt) )
    (tremoveall A nillistOfInt A)
  )
)
(assert
  (forall ( (A treeOfInt) (B Int) (C listOfInt) (D treeOfInt) (E treeOfInt) )
    (=>
      (and
        (tremove A B E)
        (tremoveall E C D)
      )
      (tremoveall A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) )
    (=>
      (= B false)
      (tcontains leaftreeOfInt A B)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Bool) )
    (=>
      (= D true)
      (tcontains (nodetreeOfInt A B C)  A D)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Bool) )
    (=>
      (and
        (= E true)
        (tcontains B D E)
      )
      (tcontains (nodetreeOfInt A B C)  D E)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Bool) )
    (=>
      (and
        (= E true)
        (tcontains C D E)
      )
      (tcontains (nodetreeOfInt A B C)  D E)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Bool) )
    (=>
      (and
        (= E false)
        (>= (- D A) 1)
        (tcontains B D E)
        (tcontains C D E)
      )
      (tcontains (nodetreeOfInt A B C)  D E)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Bool) )
    (=>
      (and
        (= E false)
        (<= (- D A) (- 1))
        (tcontains B D E)
        (tcontains C D E)
      )
      (tcontains (nodetreeOfInt A B C)  D E)
    )
  )
)
(assert
  (forall ( (A Int) (B Bool) )
    (=>
      (= B false)
      (tmember leaftreeOfInt A B)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Bool) )
    (=>
      (= D true)
      (tmember (nodetreeOfInt A B C)  A D)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Bool) (F Bool) )
    (=>
      (and
        (= F true)
        (>= (- D A) 1)
        (tmember C D E)
        (less A D F)
      )
      (tmember (nodetreeOfInt A B C)  D E)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Bool) (F Bool) )
    (=>
      (and
        (= F false)
        (<= (- D A) (- 1))
        (tmember B D E)
        (less A D F)
      )
      (tmember (nodetreeOfInt A B C)  D E)
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
    (content leaftreeOfInt nillistOfInt)
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D listOfInt) (E listOfInt) (F listOfInt) )
    (=>
      (and
        (content B E)
        (content C F)
        (append E (conslistOfInt A F) D)
      )
      (content (nodetreeOfInt A B C)  D)
    )
  )
)
(assert
  (forall ( (A Int) )
    (=>
      (= A 0)
      (tsize leaftreeOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E Int) (F Int) (G Int) )
    (=>
      (and
        (= D (+ 1 E))
        (= (+ F G) E)
        (tsize B F)
        (tsize C G)
      )
      (tsize (nodetreeOfInt A B C)  D)
    )
  )
)
(assert
  (forall ( (A Int) )
    (tinsert leaftreeOfInt A (nodetreeOfInt A leaftreeOfInt leaftreeOfInt) )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E treeOfInt) )
    (=>
      (and
        (<= A (- D 1))
        (tinsert C D E)
      )
      (tinsert (nodetreeOfInt A B C)  D (nodetreeOfInt A B E) )
    )
  )
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D Int) (E treeOfInt) )
    (=>
      (and
        (>= A D)
        (tinsert B D E)
      )
      (tinsert (nodetreeOfInt A B C)  D (nodetreeOfInt A E C) )
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
  (forall ( (A Bool) (B treeOfInt) (C Int) (D treeOfInt) (E listOfInt) (F treeOfInt) (G listOfInt) (H treeOfInt) )
    (=>
      (and
        (= A false)
        (tinsert B C D)
        (tinsertall D E F)
        (append E (conslistOfInt C nillistOfInt) G)
        (tinsertall B G H)
        (adt_equaltrees F H A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
