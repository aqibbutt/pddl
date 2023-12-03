(define (problem causal-passive-responsibility-1)  
        (:domain responsibility-attribution)
    (:objects 
        A1 A2 - agent
        table1 table2 - table
        T1 T2 - time
        act-skip act-lift - action
    )
    (:init 
        (at A1 table1)
        (at A2 table2)
        (do A1 act-lift T1)
        
    )   
    (:goal 
        (and 
            (lifted table1)
            (lifted table2)
            (do A1 act-skip T1)
            (do A2 act-lift T2 )
            )
    )
 
)