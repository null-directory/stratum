

delete [orm_meta].[templates]
where name in ('triangle','square','pentagon','homeBase')
go

insert into [orm_meta].[templates] (name)
values	('triangle')
	,	('square')
	,	('pentagon')
	,	('homeBase')

exec [orm].[property_add] 'triangle', 'sides', 'bigint', 0
exec [orm].[property_add] 'square', 'sides', 'bigint', 0
exec [orm].[property_add] 'triangle', 'color', 'nvarchar(max)', 0
exec [orm].[property_add] 'square', 'color', 'nvarchar(max)', 0

exec [orm].[create_object] 'triangle', 'someTriangle', 'A test object'
exec [orm].[create_object] 'square', 'someSquare', 'A test object'
exec [orm].[create_object] 'square', 'anotherSquare', 'Another test object'
exec [orm].[create_object] 'square', 'yaySquares', 'This is a label.'

exec [orm].[property_rename] 'square', 'color', 'colour'
exec [orm].[property_add] 'pentagon', 'lines', 'bigint'

exec [orm].[create_object] 'pentagon', 'somePentagon', 'five sides 4eva'
exec [orm].[create_object] 'homeBase', 'someSomething', 'four and a half sides'

-- Get homeBase to inherit new properties from new templates.
-- Link them out of order to make sure masking behaves correctly.
exec [orm].[inherit_add] 'square', 'homeBase', 2
exec [orm].[inherit_add] 'pentagon', 'homeBase', 1

-- label a property on homeBase and check that it stays sane through changes
exec [orm].[change_value] 'homeBase', 'someSomething', 'colour', 'blue'

-- check if homeBase's property changes name
exec [orm].[property_rename] 'square', 'colour', 'color'

-- check if homeBase's property changes name
exec [orm].[property_rename] 'pentagon', 'lines', 'edges'

-- check that an previously covered property is properly removed when inheritance is stripped
exec [orm].[property_remove] 'square', 'color'

-- add it back to double check propagation
exec [orm].[property_add] 'square', 'color', 'nvarchar(max)', 0

--exec [orm].[inherit_remove] 'square', 'homeBase'


-- HAX
-- I think it's similar to the delete: we're just not updating the 
-- views at the end
















/*
insert into [orm_meta].[templates] (name) values ('asdf')

update [orm_meta].[templates]
set name = 'qazwsx'
where name = 'asdf'

delete [orm_meta].[templates]
where name = 'qazwsx'

*/




