#28, 15, 23, 10, 3, 5, 9, 34, 14, 29 - 5 вариант

#28
SELECT DISTINCT project_id
FROM detail_amount
         JOIN provider ON detail_amount.provider_id = provider.provider_id
         JOIN detail ON detail_amount.detail_id = detail.detail_id
WHERE provider.city = 'Лондон'
  AND detail.detail_id <> 'Красный';

#15
SELECT SUM(s)
FROM detail_amount
where provider_id = 'П1';

#23
SELECT DISTINCT da.provider_id
FROM detail_amount da
         JOIN provider p on p.provider_id = da.provider_id
         JOIN detail d on d.detail_id = da.detail_id
WHERE d.colour = 'Красный';

#10
SELECT detail_id
FROM detail_amount
         JOIN provider ON detail_amount.provider_id = provider.provider_id
         JOIN project ON detail_amount.project_id = project.project_id
WHERE provider.city = 'Лондон'
  AND project.city = 'Лондон';

#3
SELECT detail_amount.provider_id FROM detail_amount WHERE project_id = 'ПР1';

#5
SELECT DISTINCT d.colour, d2.city
FROM detail d
         CROSS JOIN detail d2;

#9
SELECT detail_id
FROM detail_amount
         JOIN provider ON detail_amount.provider_id = provider.provider_id
WHERE provider.city = 'Лондон';

#34
SELECT detail_id
FROM detail_amount
         JOIN provider ON detail_amount.provider_id = provider.provider_id
         JOIN project ON detail_amount.project_id = project.project_id
WHERE provider.city = 'Лондон'
   OR project.city = 'Лондон';

#14
SELECT d.detail_id, d2.detail_id
FROM detail d
         JOIN detail_amount da on d.detail_id = da.detail_id
         JOIN provider p on da.provider_id = p.provider_id
         CROSS JOIN detail d2;

#29
SELECT da.project_id
FROM detail_amount da
WHERE da.provider_id = 'П1';


DROP DATABASE pbz2;