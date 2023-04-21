; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun insort (Int listOfInt listOfInt) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun sort (listOfInt listOfInt) Bool)
(declare-fun mem (Int listOfInt Bool) Bool)
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
  (forall ( (A Bool) (B Bool) (C Int) (D listOfInt) (E listOfInt) )
    (=>
      (and
        (= A true)
        (= B false)
        (mem C D B)
        (sort D E)
        (mem C E A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)