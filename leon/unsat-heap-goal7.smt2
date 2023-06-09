; Automatically generated by map2smt

(set-logic HORN)

(declare-datatypes ((heapOfInt 0) )
(((heapheapOfInt (rkheapOfInt Int) (valueheapOfInt Int) (leftheapOfInt heapOfInt) (rightheapOfInt heapOfInt)) (hleafheapOfInt))))
(declare-datatypes ((listOfInt 0) )
(((conslistOfInt (headlistOfInt Int) (taillistOfInt listOfInt)) (nillistOfInt))))



(declare-fun len (listOfInt Int) Bool)
(declare-fun leq (Int Int Bool) Bool)
(declare-fun rightheight (heapOfInt Int) Bool)
(declare-fun plus (Int Int Int) Bool)
(declare-fun hsize (heapOfInt Int) Bool)
(declare-fun rank (heapOfInt Int) Bool)
(declare-fun less (Int Int Bool) Bool)
(declare-fun mergea (Int heapOfInt heapOfInt heapOfInt) Bool)
(declare-fun qheapsorta (heapOfInt listOfInt listOfInt) Bool)
(declare-fun merge (heapOfInt heapOfInt heapOfInt) Bool)
(declare-fun qheapsort (listOfInt listOfInt) Bool)
(declare-fun hinsertall (listOfInt heapOfInt heapOfInt) Bool)
(declare-fun heapsorta (heapOfInt listOfInt) Bool)
(declare-fun hinsert (heapOfInt Int heapOfInt) Bool)
(declare-fun heapsort (listOfInt listOfInt) Bool)
(declare-fun hasleftistproperty (heapOfInt Bool) Bool)
(declare-fun ff () Bool)

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
  (forall ( (A Int) )
    (=>
      (= A 0)
      (rightheight hleafheapOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Int) (F Int) )
    (=>
      (and
        (= E (+ 1 F))
        (rightheight D F)
      )
      (rightheight (heapheapOfInt A B C D)  E)
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
  (forall ( (A Int) )
    (=>
      (= A 0)
      (hsize hleafheapOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Int) (F Int) (G Int) (H Int) )
    (=>
      (and
        (= E (+ 1 F))
        (hsize C G)
        (hsize D H)
        (plus G H F)
      )
      (hsize (heapheapOfInt A B C D)  E)
    )
  )
)
(assert
  (forall ( (A Int) )
    (=>
      (= A 0)
      (rank hleafheapOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) )
    (rank (heapheapOfInt A B C D)  A)
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
  (forall ( (A Int) (B heapOfInt) (C heapOfInt) (D Int) (E Bool) (F Int) (G Int) (H Int) )
    (=>
      (and
        (= E true)
        (= D (+ 1 F))
        (leq G H E)
        (rank B H)
        (rank C G)
        (rank C F)
      )
      (mergea A B C (heapheapOfInt D A B C) )
    )
  )
)
(assert
  (forall ( (A Int) (B heapOfInt) (C heapOfInt) (D Int) (E Bool) (F Int) (G Int) (H Int) )
    (=>
      (and
        (= E false)
        (= D (+ 1 F))
        (leq G H E)
        (rank B H)
        (rank C G)
        (rank B F)
      )
      (mergea A B C (heapheapOfInt D A C B) )
    )
  )
)
(assert
  (forall ( (A listOfInt) )
    (qheapsorta hleafheapOfInt A A)
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E listOfInt) (F listOfInt) (G heapOfInt) )
    (=>
      (and
        (merge C D G)
        (qheapsorta G (conslistOfInt B E) F)
      )
      (qheapsorta (heapheapOfInt A B C D)  E F)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C heapOfInt) )
    (=>
      (and
        (hinsertall A hleafheapOfInt C)
        (qheapsorta C nillistOfInt B)
      )
      (qheapsort A B)
    )
  )
)
(assert
  (forall ( (A heapOfInt) )
    (merge A hleafheapOfInt A)
  )
)
(assert
  (forall ( (A heapOfInt) )
    (merge hleafheapOfInt A A)
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Int) (F Int) (G heapOfInt) (H heapOfInt) (I heapOfInt) (J Bool) (K heapOfInt) )
    (=>
      (and
        (= J true)
        (less F B J)
        (mergea B C K I)
        (merge D (heapheapOfInt E F G H)  K)
      )
      (merge (heapheapOfInt A B C D)  (heapheapOfInt E F G H)  I)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Int) (F Int) (G heapOfInt) (H heapOfInt) (I heapOfInt) (J Bool) (K heapOfInt) )
    (=>
      (and
        (= J false)
        (less F B J)
        (mergea F G K I)
        (merge (heapheapOfInt A B C D)  H K)
      )
      (merge (heapheapOfInt A B C D)  (heapheapOfInt E F G H)  I)
    )
  )
)
(assert
    (heapsorta hleafheapOfInt nillistOfInt)
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E listOfInt) (F heapOfInt) )
    (=>
      (and
        (merge C D F)
        (heapsorta F E)
      )
      (heapsorta (heapheapOfInt A B C D)  (conslistOfInt B E))
    )
  )
)
(assert
  (forall ( (A heapOfInt) )
    (hinsertall nillistOfInt A A)
  )
)
(assert
  (forall ( (A Int) (B listOfInt) (C heapOfInt) (D heapOfInt) (E heapOfInt) )
    (=>
      (and
        (hinsertall B C E)
        (hinsert E A D)
      )
      (hinsertall (conslistOfInt A B) C D)
    )
  )
)
(assert
  (forall ( (A listOfInt) (B listOfInt) (C heapOfInt) )
    (=>
      (and
        (hinsertall A hleafheapOfInt C)
        (heapsorta C B)
      )
      (heapsort A B)
    )
  )
)
(assert
  (forall ( (A Bool) )
    (=>
      (= A true)
      (hasleftistproperty hleafheapOfInt A)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Bool) (F Int) (G Int) (H Int) )
    (=>
      (and
        (= E true)
        (= A (+ 1 F))
        (hasleftistproperty C E)
        (hasleftistproperty D E)
        (leq G H E)
        (rightheight C H)
        (rightheight D G)
        (rightheight D F)
      )
      (hasleftistproperty (heapheapOfInt A B C D)  E)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Bool) )
    (=>
      (and
        (= E false)
        (hasleftistproperty C E)
      )
      (hasleftistproperty (heapheapOfInt A B C D)  E)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Bool) )
    (=>
      (and
        (= E false)
        (hasleftistproperty D E)
      )
      (hasleftistproperty (heapheapOfInt A B C D)  E)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Bool) (F Int) (G Int) )
    (=>
      (and
        (= E false)
        (leq F G E)
        (rightheight C G)
        (rightheight D F)
      )
      (hasleftistproperty (heapheapOfInt A B C D)  E)
    )
  )
)
(assert
  (forall ( (A Int) (B Int) (C heapOfInt) (D heapOfInt) (E Bool) (F Int) )
    (=>
      (and
        (= E false)
        (not (= A (+ 1 F)))
        (rightheight D F)
      )
      (hasleftistproperty (heapheapOfInt A B C D)  E)
    )
  )
)
(assert
  (forall ( (A heapOfInt) (B Int) (C heapOfInt) (D Int) )
    (=>
      (and
        (= D 1)
        (merge (heapheapOfInt D B hleafheapOfInt hleafheapOfInt)  A C)
      )
      (hinsert A B C)
    )
  )
)
(assert
  (forall ( (A Bool) (B Int) (C Int) (D Int) (E heapOfInt) (F heapOfInt) (G heapOfInt) )
    (=>
      (and
        (= A true)
        (= (+ B C) D)
        (merge E F G)
        (hsize G D)
        (hsize E B)
        (hsize F C)
        (hasleftistproperty E A)
        (hasleftistproperty F A)
      )
      ff
    )
  )
)

(assert (not ff))
(check-sat)
