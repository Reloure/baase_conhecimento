select 
des,
substr(des,1,instr(des, ' X ' , 1, 1)) matprima  
from mpalmo --where codi='174801'
