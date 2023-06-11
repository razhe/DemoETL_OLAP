# DemoETL_OLAP
Lo primero que se hace en un proyecto SSIS (SQL Server Integration Services) es añadir las conexiones de fuente de origen y destino.

![Captura 1](https://github.com/razhe/DemoETL_OLAP/assets/65037894/563853f9-2f30-41c4-8b92-2d9a742c0e32)
1.	En la sección se hace click derecho y añadir nueva conexión OLE DB
2.	En esta sección se da a nueva y se ingresa el server name, las credenciales y se escoge la bd (recordar agregar la de origen y el dw)

Al Añadir ambas quedarían registradas en la parte inferior del IDE.

![Captura de pantalla 2023-05-11 004553](https://github.com/razhe/DemoETL_OLAP/assets/65037894/6c9c3556-5a3c-439d-8c8f-dfe1ac179184)

Para crear las tareas de flujos de datos simplemente añadimos este componente al package.

![Captura de pantalla 2023-05-11 160035](https://github.com/razhe/DemoETL_OLAP/assets/65037894/776a47c8-482e-43b9-8f56-5e9d16769400)

Dentro del package debemos agregar desde el cuadro de herramientras SSIS un componente "DataFlow Task" y crear la siguiente estructura

![Captura de pantalla 2023-05-11 160211](https://github.com/razhe/DemoETL_OLAP/assets/65037894/012cf83c-6a2e-4d98-8c6f-64ad142ab6dc)

Este seria lo que encontrariamos dentro del componente Source

![Captura de pantalla 2023-05-11 160257](https://github.com/razhe/DemoETL_OLAP/assets/65037894/4aaf4cb1-df6d-4089-9c63-36dc2a2a5057)

En esta parte especificaremos la conexión de base de datos de origen, la tabla o vista incluso podemos poner una consulta.

En el componente Look Up se especificará en este caso esta configuración debido a que los datos que utilizará vienen de una base de datos.

![Captura de pantalla 2023-05-11 160444](https://github.com/razhe/DemoETL_OLAP/assets/65037894/a50e90c3-927b-4cf9-b20a-4baf048b3052)

Aquí se agrega la conexión que usaremos y la tabla o vista o la consulta sql.

![Captura de pantalla 2023-05-11 160459](https://github.com/razhe/DemoETL_OLAP/assets/65037894/04bf44cb-bdc9-4a6f-b256-6d8afced81a4)

Por ultimo se agrega el campo de referencia para validar que no se tomen los campos que ya están en el destino, en este caso el ID.

![Captura de pantalla 2023-05-11 160717](https://github.com/razhe/DemoETL_OLAP/assets/65037894/cd6d7b46-a77b-49bf-af59-7de9115d9892)

Y el destino es básicamente lo mismo que el origen, solamente hay que revisar si las asignaciones de las columnas son correctas, en caso de que no lo sean arreglarlas de forma manual, como podemos ver en la segunda imagen.

![image](https://github.com/razhe/DemoETL_OLAP/assets/65037894/4b57bd43-b068-4c4a-b7e0-c5fc635749ea)

Y así se asignan las columnas de destino y las de origen.

![Captura de pantalla 2023-05-11 161208](https://github.com/razhe/DemoETL_OLAP/assets/65037894/6814c3f4-1d90-4404-9e80-a3716ef58682)

Para hacer el cubo OLAP es bastante sencillo, debes preocuparte de estas tres cosas.

![Captura de pantalla 2023-05-11 161512](https://github.com/razhe/DemoETL_OLAP/assets/65037894/0c2657cb-6ada-434d-9509-a46747f8f210)

Para crear el origen de datos es bastante simple, solo debes dar click derecho en orígenes de datos y “añadir nuevo origen de datos”
Se abrirá una ventana como la siguiente, solo debes dar a “nueva…”

![Captura de pantalla 2023-05-11 161752](https://github.com/razhe/DemoETL_OLAP/assets/65037894/1370d13f-8f02-4243-8eaa-f520fe003a7d)

Se abrirá la siguiente vista al darle click al botón. Aquí solamente debes especificar el servidor, el tipo de autenticación y la base de datos. Que por cierto debe ser la del DWH.

![Captura de pantalla 2023-05-11 161812](https://github.com/razhe/DemoETL_OLAP/assets/65037894/f3d44826-89dc-43ad-a19a-afa19941b7f5)

Lo único importante de la vista de datos es al seleccionar “crear nueva vista de datos” te aparecerá probablemente el origen de datos creado anteriormente, sino tendrás que agregarlo y te aparecerá un recuadro como este. Simplemente das a utilizar la cuenta de servicio y ya, siguen avanzando.

un recuadro como este. Simplemente das a utilizar la cuenta de servicio y ya, siguen avanzando. 

![Captura de pantalla 2023-05-11 162349](https://github.com/razhe/DemoETL_OLAP/assets/65037894/d49d72b0-256e-4dbb-ad55-99e9528ef7a7)

Luego cuando crees la vista te mostrará la siguiente vista, y debes pasar todas las tablas que te interesen. 

![Captura de pantalla 2023-05-11 162238](https://github.com/razhe/DemoETL_OLAP/assets/65037894/3221cfc5-569b-4449-9c1c-22b4ad60ba89)

Para el cubo OLAP debes dar click derecho en la sección y poner “Nuevo cubo…” y te saldrá algo como esto, aquí debes poner simplemente en usar tablas existentes y next

![Captura de pantalla 2023-05-11 163011](https://github.com/razhe/DemoETL_OLAP/assets/65037894/90accdd3-aa30-4823-8db9-87730d9b351c)

Aquí solo seleccionamos la tabla de medidas (tabla de hechos), luego de esta vista te mostrará las medidas que encontró y puedes desmarcar las autogeneradas.

![Captura de pantalla 2023-05-11 163059](https://github.com/razhe/DemoETL_OLAP/assets/65037894/3c42cd7e-cfde-4973-b52b-5c293b975d94)

Luego te mostrará las dimensiones y automáticamente te “detectará” las que parecen ser dimensiones. Si una no lo es no te preocupes, puedes desmarcarla.

![Captura de pantalla 2023-05-11 163202](https://github.com/razhe/DemoETL_OLAP/assets/65037894/9a264236-b16e-4892-b5e5-38dc82e5dc4f)

Te mostrará un resumen de lo que seleccionaste y finalmente se creará el cubo.

![Captura de pantalla 2023-05-11 163341](https://github.com/razhe/DemoETL_OLAP/assets/65037894/99b17a3e-3533-4eb3-80f3-4c508550b715)

Pero eso no es todo, ahora debemos hacer un ligero ajuste a las dimensiones en esta sección:

![Captura de pantalla 2023-05-11 163527](https://github.com/razhe/DemoETL_OLAP/assets/65037894/5cec0db4-1753-4d72-afbf-ec6a0163de8a)

Luego simplemente hay que agregar los campos que no se encuentren en la sección atributos, solo hay que arrastrarlos.

![Captura de pantalla 2023-05-11 163741](https://github.com/razhe/DemoETL_OLAP/assets/65037894/ad1aea30-a58d-48d7-aa8e-ff0d9630f0e1)

Una vez terminado todo esto añadiremos la tarea al flujo, de actualizar el SSAS más específicamente el cubo multidimensional. Así que a continuación agregamos una “tarea de procesamiento de analysis services” y le damos doble click o click derecho y editar. 

![Captura de pantalla 2023-05-11 164058](https://github.com/razhe/DemoETL_OLAP/assets/65037894/cb8df222-de57-4399-8cc4-a6eb38fa8d30)

A continuación, le damos a “new..” luego en la opción de “crear una conexión con un equipo que ejecuta análisis services” le damos a editar.

![Captura de pantalla 2023-05-11 164228](https://github.com/razhe/DemoETL_OLAP/assets/65037894/2fd29e12-cf62-4e1f-964f-de228ac6cb45)

En esta sección especificamos los datos y ya, es bastante intuitivo. Recuerden probar la conexión antes de nada.

![Captura de pantalla 2023-05-11 170413](https://github.com/razhe/DemoETL_OLAP/assets/65037894/d408f73e-dea9-4739-bae7-3f0a22c019c3)

Recuerden finalmente agregar las tareas que quieren que se ejecuten, en este caso seleccioné el proceso completo.

![Captura de pantalla 2023-05-11 170659](https://github.com/razhe/DemoETL_OLAP/assets/65037894/43b812ce-477b-44cf-9423-3ed74417cb08)

Para el siguiente paso, vamos a automatizar esta tarea con el sql agent de sql server, para empezar si estamos trabajando en local debemos iniciar el servicio, puedes hacerlo fácilmente buscando “SQL Server Configuration Manager” en la barra de búsqueda de Windows e iniciar el servicio.

La integración con sql server es un poco larga así que dejare el link de referencia.
https://www.youtube.com/watch?v=oDQ6FA5nZgY&list=PLx5uZDnDVXpY2JEfv0omXWC0Wxee6dKpG&index=37 

