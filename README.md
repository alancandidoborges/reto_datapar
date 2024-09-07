# Sobre el proyecto
El proyecto es una aplicación front-end desarrollada en Delphi con el objetivo de demostrar la productividad del desarrollo de una aplicación desktop utilizando los frameworks [Delphi 10.2](https://www.embarcadero.com/br/products/delphi), [Oracle Base de datos ](https://www.oracle.com/br/) juntos.

La aplicación consiste en desarrollar una solución al siguiente desafío: 

# Desafío.
Cree una aplicación utilizando los siguientes registros:

-1.Registro de Clientes:

● Implementar un formulario de registro de clientes con campos básicos.
(Nombre, CPF, Dirección, Teléfono, etc.).
● El sistema debe permitir la inclusión, edición, eliminación y consulta de
clientes.

-2. Registro del producto:
● Crear un formulario para registrar productos, incluyendo campos como
Nombre, Código, Descripción, Precio y Cantidad en Stock.
● Debe permitir operaciones CRUD (Crear, Leer, Actualizar, Eliminar).

-3.Registro de pedido:
● Implementar un módulo de pedidos donde el usuario puede seleccionar un
cliente y agregar productos al pedido.
● El pedido debe contener detalles como fecha, número de pedido, lista de
productos, cantidad, precio total y estado.

-4. Alto volumen de datos:
● Crear un MOC (Massive Operation Case) que simule la inserción de un
gran volumen de datos en el sistema (miles de pedidos, productos y
clientes) para probar el rendimiento

-5. Análisis de Impacto:
● El candidato deberá realizar un análisis de impacto sobre la adición de un
nuevo campo obligatorio al registro del producto y su impacto en los
módulos ya implementados.

6. Estándares y Buenas Prácticas:
● Seguir los estándares establecidos en la empresa, incluyendo
nomenclatura, estructura del código y creación de un catastro estándar a
ser utilizado como herencia y polimorfismo (inheritance and polymorphism)

# Tecnologías utilizadas
- Delphi 10.2.
-Oracle

# Patrón de diseño utilizado

Para el desarrollo de este desafío, se utilizaron patrones de diseño como patrón de diseño y la programación orientada a objetos se basó en la siguiente estructura según lo solicitado en el desafío:

Model
  (Clase de entidad relacional - Objeto de referencia de base de datos)
View
   Simple: la capa de interacción del usuario. Simplemente muestra el 
DAO
   El DAO es una capa aislada para el acceso a la base de datos. La clase de modelo es lo que usamos para mover objetos entre capas.
Service
   Los servicios son responsables de la lógica de negocios de su aplicación, además de ser responsables de comunicarse con las capas más internas del Software, como una capa de Datos.

También se utilizó POO utilizando los pilares que se mencionan a continuación.
Encapsulación;
Herencia;
Polimorfismo
Abstracción;
 
## Instalación de la aplicación

Requisitos previos: entorno Windows

Primero, clona el repositorio:
```
(https://github.com/alancandidoborges/reto_datapar.git)
```
Una vez hecho esto accedemos al proyecto:
```
Cree una base de datos en Oracle y ejecute el script desde el archivo
C:\Test_Datapar\CrearTables.SQL

```
# Configuración del archivo Datapar.ini

Se creó un archivo llamado "Datapar.ini" para configurar la base de datos. En este archivo tenemos todos los parámetros necesarios que utiliza el sistema para conectarse a Oracle.

En el directorio C:\Test_Datapar\Dll tenemos las dlls de Oracle necesarias para que el sistema se ejecute como cliente.

Este directorio debe configurarse en el archivo Datapar.ini en la etiqueta VendorLib. Ejemplo:
VendorLib=C:\Test_Datapar\Dll\oci.dll

![imagen](https://github.com/user-attachments/assets/d40acf89-1b05-4738-8200-0fbfb31d4c93)

# Autor

Alan Candido Borges Barreto

(https://www.linkedin.com/in/alan-candido-borges-barreto-303240176/)
