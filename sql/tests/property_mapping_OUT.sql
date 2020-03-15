

--exec [orm].[property_rename] 'square', 'colour', 'color'
--exec [orm].[property_rename] 'square', 'color', 'colour'
go

select * from [orm].[triangle_wide]
select * from [orm].[square_wide]
select * from [orm].[pentagon_wide]
select * from [orm].[sqentagon_wide]

go

select	t.name as [template]
	,	o.name as [object]
	,	p.name as [property]
	,	v.value
	,	t.templateID
	,	o.objectID
	,	p.propertyID
from [orm_meta].[values_string] as v
	inner join [orm_meta].[objects] as o
		on v.objectID = o.objectID
	inner join [orm_meta].[properties] as p
		on v.propertyID = p.propertyID
	inner join [orm_meta].[templates] as t
		on p.templateID = t.templateID
where p.datatypeID = 1
order by t.templateID, o.name, p.name