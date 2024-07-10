create database DBCrudAngular

go

use DDCrudAngular

create table Empleado(
IdEmpleado int primary key identity,
NombreCompleto varchar(50),
Correo varchar(50),
Sueldo decimal(10,2),
FechaContrato date
)

go

insert into Empleado(NombreCompleto,Correo,Sueldo,FechaContrato)
values
('Marcela Lopez', 'marcela@gmail.com',500000,'2024-05-25')

select * from Empleado


create proc sp_listaEmpleados
as
begin
	select 
	IdEmpleado,
	NombreCompleto,
	Correo,
	Sueldo,
	CONVERT(char(10),FechaContrato,103)[FechaContrato]
	from Empleado
end

go

create proc sp_obtenerEmpleado(
@IdEmpleado int
)
as
begin
	select 
	IdEmpleado,
	NombreCompleto,
	Correo,
	Sueldo,
	CONVERT(char(10),FechaContrato,103)[FechaContrato]
	from Empleado where IdEmpleado = @IdEmpleado 
end

go

create proc sp_crearEmpleado(
@NombreCompleto varchar(50),
@Correo varchar(50),
@Sueldo decimal(10,2),
@FechaContrato varchar(10)
)
as
begin
set dateformat dmy

	insert into Empleado
	(NombreCompleto,
	Correo,
	Sueldo,
	FechaContrato)
	values
	(@NombreCompleto,
	@Correo,
	@Sueldo,
	convert (date,@FechaContrato)
	)
end


go


create proc sp_editarEmpleado(
@IdEmpleado int,
@NombreCompleto varchar(50),
@Correo varchar(50),
@Sueldo decimal(10,2),
@FechaContrato varchar(10)
)
as
begin
set dateformat dmy

	update Empleado
	set
	NombreCompleto = @NombreCompleto,
	Correo = @Correo,
	Sueldo = @Sueldo,
	FechaContrato = convert (date,@FechaContrato)
	where IdEmpleado = @IdEmpleado
end

go

create proc sp_eliminarEmpleado(
@IdEmpleado int
)
as
begin
	delete from Empleado where IdEmpleado = @IdEmpleado
end

