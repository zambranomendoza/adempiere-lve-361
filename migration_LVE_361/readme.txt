0. Instalar la localización Colombia  siguiendo los pasos indicados en
el siguiente link:

     http://www.adempiere.com/LCO_Instrucciones_Instalacion

1.  Ubicar el script dentro de la localización Venezuela LVE_361  y
ejecutelo en su base de datos

     Directorio:

          LVE_361/script/Change_language_from_es_CO_to_es_VE.sql

2. Ubicar el directorio LVE_361/es_ve

3. Ingrese a Adempiere con rol System Administrator (preferible con
lenguaje English pues las instrucciones son con los nombres de
procesos en inglés)

4. Abra la ventana "Translation Import/Export"

5. Seleccione en Language la opción Spanish (Venezuela)

      5.1. Deje los campos Client y Table en blanco

6. Oprima el botón Import y seleccione el directorio donde se descargó
o descomprimió los archivos xml de la traducción es_VE

7. Cuando este proceso finalice puede cerrar la ventana

8. Ejecute ahora el proceso Synchronize Terminology

10. Ubicar el directorio migration_LVE_361/LVE_361

11. Ejecute el Script de customization.sql

12. Ejecute Menu -> System Admin -> General Rules ->
Sequence Check .

13. Ejecute el Script de 1Pre_Packing_deposito.sql

14. Ejecute Menu -> System Admin -> General Rules ->
Sequence Check .

15. Ingrese a Adempiere con rol System Adminitrator ( Lenguaje
English)

16. Abra la ventana Menu -> Aplication Dictionary -> Aplication
Packaging -> PackIn.

17. Ubique el directorio migration_LVE_361/package y ejecute los
siguientes paquetes:

     LVE_DeleteOrCancelInvoice.zip
     LVE_deletePayment.zip
     LVERetenciones.zip
     LVE_Deposit.zip

     Nota: luego de la ejecución de cada paquete es de GRAN IMPORTACIA
ejecutar
el proceso ubicado en: Menu -> System Admin -> General Rules ->
Sequence Check .

18. Ejecute el Script de 2Post_Packing_Deposito

19. Ejecute Menu -> System Admin -> General Rules ->
Sequence Check .

20. Ejecutar el script por consola:

     LVE_361/script/Migracion LVE_361/LVE_361/LVE_postgresql.sh

    Comando consola:

         sudo ./LVE_postgresql.sh 361 commit | psql -U adempiere -d
adempiere >361.lst

21. Ejecutar el proceso ubicado en: Menu -> System Admin ->
General Rules -> Sequence Check.

22. Ubicar y abrir el scrip de retenciones:

    migration_LVE_361/LVE_361/withholding_LVE361.sql
    
23. Antes de la ejecución del script previamente 
usted debe tener creada la compañía a la cual se le va a 
aplicar la configuración, una vez que esté creada reemplace las 
ocurrencias de  @ID_CLIENT@ por el ID que se le generó al momento 
de la creación de la compañía.

24. Proceda a la ejecución del script withholding_LVE361.sql

25. Ubicar y abrir el scrip de traducción de documentos:

    migration_LVE_361/LVE_361/documentsTraslation_LVE361.sql
    
26. Antes de la ejecución del script previamente 
usted debe tener creada la compañía a la cual se le va a 
aplicar la configuración, una vez que esté creada reemplace las 
ocurrencias de  @ID_CLIENT@ por el ID que se le generó al momento 
de la creación de la compañía.

27. Proceda a la ejecución del script documentsTraslation_LVE361.sql

28. Ubicar y abrir el scrip de 3Deposito_cambios_Organizacion.sql:

    migration_LVE_361/LVE_361/3Deposito_cambios_Organizacion.sql
    
29. Antes de la ejecución del script previamente 
usted debe tener creada la compañía a la cual se le va a 
aplicar la configuración, una vez que esté creada reemplace las 
ocurrencias de  @ID_CLIENT@ por el ID que se le generó al momento 
de la creación de la compañía.

30. Proceda a la ejecución del script 3Deposito_cambios_Organizacion.sql

31. Ubicar y abrir el scrip de bank_lve361.sql:

    migration_LVE_361/LVE_361/bank_lve361.sql
    
32. Antes de la ejecución del script previamente 
usted debe tener creada la compañía a la cual se le va a 
aplicar la configuración, una vez que esté creada reemplace las 
ocurrencias de  @ID_CLIENT@ por el ID que se le generó al momento 
de la creación de la compañía.

33. Proceda a la ejecución del script bank_lve361.sql