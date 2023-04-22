select
  n.name, gender, cn.name, pi.info,
  datediff(now(), STR_TO_DATE(pi.info, '%e %M %Y'))/365.25 as age_now,
  production_year - substring_index(pi.info,' ', -1) as age_then, nr_order, role_id
from imdb.title t
join imdb.cast_info ci on t.id=ci.movie_id
join imdb.name n on n.id=ci.person_id
join imdb.char_name cn on cn.id=ci.person_role_id
join imdb.person_info pi on pi.person_id=n.id
where t.title='Dark City' and production_year=1998
and pi.info_type_id=21    -- date of birth field
order by coalesce(nr_order,1000)    -- "end credits order"
;
