UPDATE Salary SET sex = 

    CASE 
       WHEN sex="m" Then "f"
       When sex="f" Then "m"
    END ;