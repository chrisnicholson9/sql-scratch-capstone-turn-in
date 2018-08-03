Task 1
 select *
 from survey
 limit 10;
Task 2
 select question, count(question) as 'count'
 from survey
 group by question;
Task 3
 select 
         question, 
  count(question) as 'count',
  count(question)*100/500 as '% completed'
 from survey
 group by question;
Task 4
 select *
 from quiz
 limit 5;
 
 select *
 from home_try_on
 limit 5;
 
 select * 
 from purchase
 limit 5;
Task 5
select distinct quiz.user_id,
   home_try_on.user_id is not NULL as 'is_home_try_on',
   home_try_on.number_of_pairs,
   purchase.user_id is not NULL as 'is_purchase'
from quiz
        left join home_try_on 
           on home_try_on.user_id = quiz.user_id
        left join purchase 
           on quiz.user_id = purchase.user_id
limit 10;
Task 6.1
With tbl AS(
SELECT DISTINCT quiz.user_id,
   home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
   home_try_on.number_of_pairs,
   purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
        LEFT JOIN home_try_on 
           ON home_try_on.user_id = quiz.user_id
        LEFT JOIN purchase 
           ON quiz.user_id = purchase.user_id)
-- create working table ^
Select count(user_id),
        sum(is_home_try_on),
  sum(is_purchase),
  (495*100/1000) as conversion
from tbl;
-- calculate funnel and absolute conversion rate ^
Task 6.2
With tbl AS(
SELECT DISTINCT quiz.user_id,
   home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
   home_try_on.number_of_pairs,
   purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
        LEFT JOIN home_try_on 
           ON home_try_on.user_id = quiz.user_id
        LEFT JOIN purchase 
           ON quiz.user_id = purchase.user_id)
-- create working table ^
Select number_of_pairs, 
        sum(is_home_try_on),
  sum(is_purchase)
from tbl
group by number_of_pairs;
-- calculate funnel by number of pairs ^