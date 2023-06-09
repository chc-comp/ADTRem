; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((treeOfInt 0) )
(((nodetreeOfInt (datatreeOfInt Int) (lefttreeOfInt treeOfInt) (righttreeOfInt treeOfInt)) (leaftreeOfInt))))



(declare-fun leq (Int Int Bool) Bool)
(declare-fun height (treeOfInt Int) Bool)
(declare-fun mirror (treeOfInt treeOfInt) Bool)
(declare-fun nmax (Int Int Int) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun ff () Bool)

(assert
  (forall ( (A Int) (B Int) )
    (=>
      (and
        (>= A 0)
        (>= B 0)
        (>= A B)
      )
      (nmax A B A)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) )
    (=>
      (and
        (>= A 0)
        (>= B 0)
        (>= B (+ A 1))
      )
      (nmax A B B)
    )
  )
)
(assert
    (mirror leaftreeOfInt leaftreeOfInt)
)
(assert
  (forall ( (A Int) (B treeOfInt) (C treeOfInt) (D treeOfInt) (E treeOfInt) )
    (=>
      (and
        (mirror C D)
        (mirror B E)
      )
      (mirror (nodetreeOfInt A B C)  (nodetreeOfInt A D E) )
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
  (forall ( (A Int) (B Int) (C treeOfInt) (D treeOfInt) )
    (=>
      (and
        (>= (- A B) 1)
        (mirror C D)
        (height D B)
        (height C A)
      )
      ff
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C treeOfInt) (D treeOfInt) )
    (=>
      (and
        (<= (- A B) (- 1))
        (mirror C D)
        (height D B)
        (height C A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
