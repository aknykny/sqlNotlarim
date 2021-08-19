select * from developers
intersect
select * from testers;

select names from developers
union
select names from testers;

select names from developers
intersect
select names from testers;