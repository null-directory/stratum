print '
Generating value tables...'

IF OBJECT_ID('[orm_meta].[values_string]', 'U') IS NOT NULL
	drop table [orm_meta].[values_string]
go


create table [orm_meta].[values_string]
(	-- templateID = 1
	instanceID int not null
,	propertyID int not null
,	value nvarchar(max)

,	constraint pk_[orm_meta].[values_string_instance_property] primary key (instanceID, propertyID)
,	constraint fk_[orm_meta].[values_string_instance] foreign key (instanceID) references [orm_meta].[instances] (instanceID) on delete cascade
,	constraint fk_[orm_meta].[values_string_property] foreign key (propertyID) references [orm_meta].[properties] (propertyID) 
)
go


IF OBJECT_ID('[orm_meta].[values_integer]', 'U') IS NOT NULL
	drop table [orm_meta].[values_integer]
go

create table [orm_meta].[values_integer]
(	-- templateID = 2
	instanceID int not null
,	propertyID int not null
,	value bigint

,	constraint pk_[orm_meta].[values_integer_instance_property] primary key (instanceID, propertyID)
,	constraint fk_[orm_meta].[values_integer_instance] foreign key (instanceID) references [orm_meta].[instances] (instanceID) on delete cascade
,	constraint fk_[orm_meta].[values_integer_property] foreign key (propertyID) references [orm_meta].[properties] (propertyID) 
)
go


IF OBJECT_ID('[orm_meta].[values_decimal]', 'U') IS NOT NULL
	drop table [orm_meta].[values_decimal]
go

create table [orm_meta].[values_decimal]
(	-- templateID = 3
	instanceID int not null
,	propertyID int not null
,	value decimal(19,8)

,	constraint pk_[orm_meta].[values_decimal_instance_property] primary key (instanceID, propertyID)
,	constraint fk_[orm_meta].[values_decimal_instance] foreign key (instanceID) references [orm_meta].[instances] (instanceID) on delete cascade
,	constraint fk_[orm_meta].[values_decimal_property] foreign key (propertyID) references [orm_meta].[properties] (propertyID) 
)
go


IF OBJECT_ID('[orm_meta].[values_datetime]', 'U') IS NOT NULL
	drop table [orm_meta].[values_datetime]
go

create table [orm_meta].[values_datetime]
(	-- templateID = 4
	instanceID int not null
,	propertyID int not null
,	value datetime

,	constraint pk_[orm_meta].[values_datetime_instance_property] primary key (instanceID, propertyID)
,	constraint fk_[orm_meta].[values_datetime_instance] foreign key (instanceID) references [orm_meta].[instances] (instanceID) on delete cascade
,	constraint fk_[orm_meta].[values_datetime_property] foreign key (propertyID) references [orm_meta].[properties] (propertyID)
)
go


IF OBJECT_ID('[orm_meta].[values_instance]', 'U') IS NOT NULL
	drop table [orm_meta].[values_instance]
go

create table [orm_meta].[values_instance]
(	-- templateID >= 5
	instanceID int not null
,	propertyID int not null
,	value varchar(250)

,	constraint pk_[orm_meta].[values_instances_instance_property_instanceName] primary key (instanceID, propertyID, value)
,	constraint fk_[orm_meta].[values_instances_instance] foreign key (instanceID) references [orm_meta].[instances] (instanceID) on delete cascade
,	constraint fk_[orm_meta].[values_instances_property] foreign key (propertyID) references [orm_meta].[properties] (propertyID) 
)
create index ix_[orm_meta].[values_instances_instance_property] on [orm_meta].[values_instance] (instanceID, propertyID)
go