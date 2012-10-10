/*

Descripción: Consultas para crear los días no laborables en el calendario
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Actualizar las fechas de carnaval y de semana santa
- Eliminar los días no laborables que no apliquen a la región en donde se encuentre la organización
- Reemplazar:
    @ad_client_id por el id de la compañía
    @ad_org_id por el id de la organización
    @año por el que corresponda al calendario de no laborables a incluir
    @c_calendar_id por el id del calendario a asociar
- Ejecutar los scripts

*/

INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, '1ro de Enero', '@año-01-01 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Divina Pastora', '@año-01-14 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Carnaval', '@año-02-20 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Carnaval', '@año-02-21 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Lunes Santo', '@año-04-02 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Martes Santo', '@año-04-03 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Miércoles Santo', '@año-04-04 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Jueves Santo', '@año-04-05 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Viernes Santo', '@año-04-06 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Declaración de la Independencia', '@año-04-19 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Día del trabajador', '@año-05-01 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Día de Jacinto Lara', '@año-05-28 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Aniversario de la Batalla de Carabobo', '@año-06-24 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Día de la Independencia', '@año-07-05 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Natalicio de Simón Bolívar', '@año-07-24 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Día de Barquisimeto', '@año-09-14 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Día de la resistencia indígena', '@año-10-12 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Día de Navidad', '@año-12-24 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Nacimiento de Jésus', '@año-12-25 00:00:00.0', @c_calendar_id)
go
INSERT INTO adempiere.c_nonbusinessday(c_nonbusinessday_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, date1, c_calendar_id) 
VALUES((SELECT MAX(c_nonbusinessday_id) + 1 FROM c_nonbusinessday), @ad_client_id, @ad_org_id, 'Y', getdate(), 100, getdate(), 100, 'Fin de Año', '@año-12-31 00:00:00.0', @c_calendar_id)
go

