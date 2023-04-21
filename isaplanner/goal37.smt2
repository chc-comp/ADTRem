; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun leq (Int Int Bool) Bool)
(declare-fun map_not (Bool Bool) Bool)
(declare-fun mem (Int listOfInt Bool) Bool)
(declare-fun delete (Int listOfInt listOfInt) Bool)
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
        (= D false)
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
        (= D false)
        (= D false)
        (<= (- B A) (- 1))
        (mem A C D)
      )
      (mem A (conslistOfInt B C) D)
    )
  )
)
(assert
  (forall ( (A Int) )
    (delete A nillistOfInt nillistOfInt)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C listOfInt) )
    (=>
      (delete A B C)
      (delete A (conslistOfInt A B) C)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (>= (- B A) 1)
        (delete A C D)
      )
      (delete A (conslistOfInt B C) (conslistOfInt B D))
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C listOfInt) (D listOfInt) )
    (=>
      (and
        (<= (- B A) (- 1))
        (delete A C D)
      )
      (delete A (conslistOfInt B C) (conslistOfInt B D))
    )
  )
)
(assert
  (forall ( (A Bool) (B Int) (C listOfInt) (D listOfInt) (E Bool) )
    (=>
      (and
        (= A false)
        (delete B C D)
        (mem B D E)
        (map_not E A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)