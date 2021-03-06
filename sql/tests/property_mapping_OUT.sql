

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
	,	t.template_id
	,	o.object_id
	,	p.property_id
from [orm_meta].[values_string] as v
	inner join [orm_meta].[objects] as o
		on v.object_id = o.object_id
	inner join [orm_meta].[properties] as p
		on v.property_id = p.property_id
	inner join [orm_meta].[templates] as t
		on p.template_id = t.template_id
where p.datatype_id = 1
order by t.template_id, o.name, p.name�