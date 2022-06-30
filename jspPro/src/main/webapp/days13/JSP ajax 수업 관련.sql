with temp as ( 
                 select empno, ename, sal, 
                        rank() over(order by sal desc) r 
                from emp 
         )
select * from temp 
where r <= 5 ;

--
update emp
set sal = 500
where empno = 7839;

commit;

--
update emp
set sal = 4000
where empno = 7839;

commit;

--
update emp
set sal = 5000
where empno = 7839;

commit;