SET serveroutput ON;

CREATE OR REPLACE PACKAGE knn AS
    PROCEDURE knn_algorithm(n integer) ;
    PROCEDURE show_result ;
END knn;
/

CREATE OR REPLACE PACKAGE BODY knn AS

    bcount integer := 0;
    mcount integer := 0;
    
    procedure knn_algorithm(n integer) is
    
    
    
    
    CURSOR neighbours IS
    SELECT
    id_dataset,diagnosis
                               FROM
    dataset
                               WHERE
    rownum <=n
    order by sqrt(  
(radius_mean -18.25)*(radius_mean -18.25)
+(texture_mean -19.98)*(texture_mean -19.98)
+(perimeter_mean -119.6)*(perimeter_mean -119.6)
+(area_mean -1040)*(area_mean -1040)
+(smoothness_mean -.09463)*(smoothness_mean -.09463)
+(compactness_mean -.109)*(compactness_mean -.109)
+(concavity_mean -.1127)*(concavity_mean -.1127)
+(concave_points_mean -.074)*(concave_points_mean -.074)
+(symmetry_mean -.1794)*(symmetry_mean -.1794)
+(fractal_dimension_mean -.05742)*(fractal_dimension_mean -.05742)
+(radius_se -.4467)*(radius_se -.4467)
+(texture_se -.7732)*(texture_se -.7732)
+(perimeter_se -3.18)*(perimeter_se -3.18)
+(area_se -53.91)*(area_se -53.91)
+(smoothness_se -.004314)*(smoothness_se -.004314)
+(compactness_se -.01382)*(compactness_se -.01382)
+(concavity_se -.02254)*(concavity_se -.02254)
+(concave_points_se -.01039)*(concave_points_se -.01039)
+(symmetry_se -.01369)*(symmetry_se -.01369)
+(fractal_dimension_se -.002179)*(fractal_dimension_se -.002179)
+(radius_worst -22.88)*(radius_worst -22.88)
+(texture_worst -27.66)*(texture_worst -27.66)
+(perimeter_worst -153.2)*(perimeter_worst -153.2)
+(area_worst -1606)*(area_worst -1606)
+(smoothness_worst -.1442)*(smoothness_worst -.1442)
+(compactness_worst -.2576)*(compactness_worst -.2576)
+(concavity_worst -.3784)*(concavity_worst -.3784)
+(concave_points_worst -.1932)*(concave_points_worst -.1932)
+(symmetry_worst -.3063)*(symmetry_worst -.3063)
+(fractal_dimension_worst -.08368)*(fractal_dimension_worst -.08368)
        );

    neighbor neighbours%ROWTYPE;
    
    BEGIN
    
    OPEN neighbours;

     LOOP
    FETCH neighbours INTO neighbor;
    EXIT WHEN neighbours%notfound;
    
         
         
    IF
        neighbor.diagnosis = 'B'
    THEN
        bcount := bcount + 1;
    ELSE
        mcount := mcount +1;
    END IF;
         
         dbms_output.put_line(neighbor.id_dataset|| '  '|| neighbor.diagnosis);
    END LOOP;

     CLOSE neighbours;
    
    END knn_algorithm;
    
    PROCEDURE show_result IS
    
        
    BEGIN
     IF bcount < mcount
        
    THEN
       dbms_output.put_line('The tumor is Malignant');
    ELSE
        dbms_output.put_line('The tumor is Benign');
    END IF;
         
         
     END show_result;
    
    
    

END knn;
/