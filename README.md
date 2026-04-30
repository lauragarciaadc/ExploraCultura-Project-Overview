
# ExploraCultura

## Miembros del grupo L4-OMD-5

1. Llamas Muñoz, José Andrés
1. Cordero Girón, Reyes
1. García de la Cruz, Laura
1. Segovia Quintano, Julia

## 1. Introducción al problema

- A todos nos ha ocurrido alguna vez eso de querer visitar un lugar pero no tener tiempo para organizarlo. La mayoría de turistas no llegan a conocer los lugares más emblemáticos de las ciudades visitadas, bien por desconocimiento del destino, por encontrar información contradictoria en Internet o, en general, una mala organización del viaje.
- Actualmente, existen varias plataformas globales donde los usuarios pueden compartir reseñas (por ejemplo, TripAdvisor, Google Reviews), pero la mayoría de ellas tienen un enfoque muy amplio. En muchas ocasiones, estas plataformas carecen de especificidad para ciertos nichos turísticos o no ofrecen una categorización precisa de las experiencias.
- Además, los viajeros suelen enfrentarse a la sobrecarga de información: demasiados comentarios y valoraciones que pueden dificultar la toma de decisiones. Por otro lado, las pequeñas empresas turísticas locales tienen dificultades para destacar en plataformas masivas, lo que limita su visibilidad.
- El objetivo principal de ExploraCultura es construir una plataforma intuitiva y eficiente para puntuar sitios turísticos que no solo permita a los usuarios compartir y leer reseñas, sino que también ofrezca una experiencia visual rica con fotos y videos cargados por los usuarios, que cuente con una clasificación precisa de los lugares según criterios como tipo de turismo, presupuesto, accesibilidad, etc., que permita a los negocios promoverse directamente en la plataforma y mejorar su visibilidad ante potenciales clientes.
- Los usuarios podrán, a través de ExploraCultura: puntuar lugares en función de su experiencia en aspectos como calidad, precio, accesibilidad, etc.; buscar lugares filtrando según sus preferencias (tipo de actividad, proximidad, presupuesto, etc.).
- Incluiremos contenido alternativo como mapas interactivos, donde los usuarios puedan ver los lugares mejor puntuados cerca de ellos o en su destino y la posibilidad de subir fotos y videos para respaldar sus reseñas, haciendo que la información sea más visual y detallada.
- ExploraCultura te ayuda a buscar y descubrir lugares interesantes de forma personalizada, donde quiera que estés en el mundo, teniendo en cuenta tus preferencias, ya que aprende de lo que te gusta y te dirige a lugares que te encantarán.

## 2. Glosario de términos

-Algoritmo de Recomendación: conjunto de reglas o procesos matemáticos utilizados para sugerir sitios turísticos a los usuarios en función de sus preferencias, historial de búsquedas y puntuaciones anteriores.

-Autenticación de Usuarios: proceso mediante el cual los usuarios deben validar su identidad (a través de email, redes sociales o contraseñas) para acceder a ciertas funciones de la plataforma, como dejar reseñas o ver información personalizada.

-Comentarios Verificados: reseñas o valoraciones que han sido confirmadas como auténticas, generalmente mediante la comprobación de que el usuario realmente visitó el sitio turístico.

-Filtros de Búsqueda: herramientas dentro de la plataforma que permiten a los usuarios refinar sus búsquedas en función de criterios como el tipo de turismo (aventura, cultural, gastronómico), localización, rango de precios, popularidad, etc.

-Geolocalización: tecnología que permite ubicar la posición exacta de un usuario en un mapa, utilizada para mostrar recomendaciones cercanas a su ubicación actual o para ayudar a planificar rutas turísticas. Los usuarios pueden encontrar sitios mejor puntuados cerca de ellos o en un destino específico.

-Interfaz de Usuario: parte visual y funcional de la plataforma con la que los usuarios interactúan.

-Mapa Interactivo: herramienta visual que permite a los usuarios explorar sitios turísticos en un mapa, accediendo a información adicional como reseñas, puntuaciones y fotos de los lugares al hacer clic en las ubicaciones marcadas.

-Puntuación de Usuarios: valoración que los usuarios otorgan a un sitio turístico en función de su experiencia. Generalmente se mide en una escala numérica.

-Ranking de Lugares: clasificación de sitios turísticos basada en la puntuación promedio que han recibido de los usuarios. Los sitios mejor puntuados tienden a aparecer en los primeros lugares de las búsquedas y en los listados de popularidad de la plataforma.

-Reseña: texto escrito por un usuario donde describe su experiencia en un sitio turístico, con la posibilidad de añadir fotos y vídeos.

-Sitio Turístico: cualquier lugar o atracción que los viajeros visitan por su interés histórico, cultural, natural o recreativo.

-Valoración Promedio: promedio de todas las puntuaciones otorgadas por los usuarios a un sitio turístico. Se calcula sumando todas las puntuaciones individuales y dividiéndolas por el número total de reseñas (media aritmética).


## 3. Visión general del sistema
### 3.1. Requisitos generales

- RG1: Disponibilidad multiplataforma: queremos que el sistema funcione tanto en dispositivos móviles (iOS y Android) como en navegadores web, asi podremos llegar a más usuarios.
- RG2: Integración con servicios de mapas: necesitaremos el uso de mapas (Google Maps, Google earth) para mostrar y ubicar los lugares añadidos por los usuarios, basándose en su ubicación actual.
- RG3: Sistema de reseñas y puntuación: los usuarios dejarán opiniones y calificaciones de los lugares visitados para ayudar a futuros usuarios
- RG4: Interfaz de usuario intuitiva: la aplicación debe contar con una interfaz fácil de usar, que permita a los usuarios explorar, puntuar y dejar reseñas de los lugares visitados sin complicaciones.
- RG5: Búsqueda avanzada de sitios: el sistema debe ofrecer una función de búsqueda avanzada para que los turistas puedan filtrar los lugares de interés según categorías ya sean restaurantes, museos,etc., además de las valoraciones de los distintos turistas y los comentarios en dichos lugares(Podiendo añadir fortos, puntuación...).
- RG6: Búsqueda avanzada de perfiles de otros usuarios (con la posibilidad de seguirlos) para ver sus lugares recomendados.

### 3.2. Usuarios del sistema
- Turistas:
    Personas que usan la aplicación para explorar nuevas lugares y descubrir puntos de interés turísticos y de ocio.
    Posibilidades a la hora de usar ExploraCulta: Buscar lugares, puntuar, dejar reseñas y marcar los sitios visitados.

- Administradores del sistema:
    Personas encargadas de administrar y moderar la plataforma, añadiendo o actualizando información sobre los lugares y moderando las reseñas y puntuaciones de los usuarios.
    Posibilidades/Responsabilidades a la hora de usar ExploraCultura: Gestionar los contenidos, actualizar información sobre los sitios, y mantener la base de datos de lugares.

- Guías turísticos:
    Perfil: Guías turísticos que pueden promocionar sus servicios o lugares dentro de la plataforma.
    Posibilidades a la hora de usar ExploraCultura: Publicar información sobre sus servicios o sitios turísticos, ofrecer promociones o rutas guiadas, y responder a las reseñas de los usuarios.


## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.01. Registro de Usuario
Como usuario quiero registrarme mediante un correo o un número de teléfono para poder acceder a mi cuenta y usar ExploraCultura.
**Prueba de aceptación**
- Un usuario cuando se registre recibirá un sms asociado a su número para confirmar el registro.
- Se debe aplicar la regla de negocio R.N.01: Solo los usuarios registrados pueden acceder a las funcionalidades avanzadas de la app.

#### R.F.02. Exploración de lugares populares
Como usuario, quiero ver un listado de los lugares más populares de la ciudad que me interese para conocer los sitios más visitados y mejor valorados.

**Prueba de aceptación:**
- El sistema debe mostrar un listado de lugares populares basados en la puntuación promedio.
- El usuario debe poder filtrar este listado por categorías (monumentos, restaurantes, etc.).

#### R.F.03. Reseñas y puntuación de lugares
Como usuario, quiero poder dejar reseñas y puntuaciones de los lugares que visito para compartir mi experiencia con otros usuarios.

**Prueba de aceptación:**

- El sistema debe permitir al usuario escribir una reseña y otorgar una puntuación al lugar visitado.
- Las reseñas deben pasar por el sistema de moderación antes de ser publicadas.
 
#### R.F.04. Registro de nuevas visitas
Como usuario, quiero poder marcar los lugares que visito y actualizarlos en mi diario de viaje para tener un historial de todas mis experiencias.
**Prueba de aceptación:**
- El sistema debe permitir al usuario registrar una nueva visita y agregar notas o reseñas.
- Las visitas registradas deben actualizar automáticamente el historial del usuario.

#### 4.1.1. Requisitos de información

##### R.I.01. Información de lugares turísticos
Como administrador del sistema,
quiero que cada lugar turístico registrado incluya información completa (nombre, descripción, dirección, categoría, rango de edades, multimedia, estaFiltrado), para que los usuarios puedan acceder a datos precisos y de calidad para poder tomar decisiones informadas al planificar sus visita. EstaFiltrado (boolean) verifica a los usuarios que el lugar ha sido comprobado y aceptado por los administradores, los lugares que tienen estaFiltrado como 'false' no apareceran en la app.

###### *Prueba de aceptación:*
- Comprobar que cada lugar turístico tenga un nombre, descripción, dirección, categoría y rango de edad.
- Verificar que los datos obligatorios están correctamente registrados antes de que el lugar se publique en la app.
- estaFiltrado es una verificación del lugar por lo propios administradores (boolean).

 ##### R.I.02. Información de comercios locales
Como comercio local,
quiero que mi perfil incluya detalles como horario y el enlace web.
para atraer a más visitantes proporcionando información relevante y atractiva sobre mi negocio.

###### *Prueba de aceptación:*
- Comprobar que el perfil del negocio incluya horario de apertura y cierre y enlace web.

##### R.I.03. Historial de visitas del usuario
Como usuario registrado,
quiero acceder a un historial de los lugares que he visitado para tener un registro organizado de mis experiencias y poder consultar las reseñas y fotos que he subido.

###### *Prueba de aceptación:*
- Verificar que cada vez que un usuario visita un lugar, aparece en su historial.
- Comprobar que el historial incluye los lugares visitados.

##### R.I.04. Información de eventos en lugares culturales
Como usuario,
quiero ver los eventos próximos en los lugares que me interesan, debe incluir nombre, fecha de inicio y de final y descripción.

###### *Prueba de aceptación:*
- Comprobar que los administradores pueden añadir eventos a los perfiles de los lugares.
- Verificar que los usuarios pueden ver los eventos en la página del lugar.
- Comprobar que la fecha y hora de los eventos se muestran correctamente y están actualizadas.

##### R.I.05. Información de reseñas de usuarios
Como usuario,
quiero acceder a las reseñas, que deben incluir puntuación, contenido que describa la experiencia, la fecha en la que se realiza, opcionalmente se puede añador multimedia y debe estar filtrada..

###### *Prueba de aceptación:*
- Asegurar que los turistas pueden publicar reseñas.

##### R.I.06. Información multimedia de los lugares
Como administrador del sistema,
quiero que los lugares turísticos y comercios locales incluyan contenido multimedia cargados por usuarios,
para hacer las reseñas más visuales y atractivas, permitiendo a los usuarios ver cómo es el lugar antes de visitarlo.

###### *Prueba de aceptación.*
- Comprobar que los usuarios pueden subir fotos y videos junto con sus reseñas.
- Asegurar que los administradores pueden aprobar o eliminar contenido inapropiado subido por los usuarios.

##### R.I.07. Geolocalización de lugares visitados
Como usuario,
quiero ver los lugares próximos a mi localizacióny para ello debo tener la geolocalización activa.

###### *Prueba de aceptación:*
- Verificar que los usuarios tienen la geolocalización activa.

#### 4.1.2. Reglas de negocio
##### R.N.01. Registro de Usuarios Verificado
Solo los usuarios que hayan completado el proceso de verificación (mediante correo electrónico o número de teléfono) podrán acceder a las funcionalidades avanzadas de la plataforma, como la creación de reseñas y la personalización del perfil.
Descripción: Esta regla asegura que solo usuarios verificados pueden contribuir a la plataforma, evitando cuentas falsas o spam. Un sistema de verificación deberá estar en su lugar antes de permitir el acceso completo.

##### R.N.02. Moderación de lugares y reseñas
Todas las reseñas y lugares publicados por los usuarios deben pasar por un proceso de moderación antes de ser publicadas en la plataforma mediante el valor booleano 'estaFiltrado'. Descripción: Se requiere que el sistema filtre o revise automáticamente las reseñas y lugares para evitar contenido ofensivo, inapropiado o irrelevante. Las reseñas y lugares sospechosos serán revisadas manualmente por los administradores antes de ser visibles para el público, en resumen, no aparecerán lugares ni reseñas que tengan como valor 'false' su parámetro 'estaFiltrado'.

##### R.N.03. Geolocalización Activa para Búsqueda por Proximidad
Para que los usuarios puedan utilizar la funcionalidad de búsqueda de lugares por proximidad, deberán tener activada la geolocalización en sus dispositivos.
Descripción: La búsqueda por proximidad solo funcionará si el usuario permite el acceso a su ubicación. Si la geolocalización está desactivada, el sistema deberá mostrar un mensaje solicitando su activación.

##### R.N.04. Puntuación Única por Usuario y Lugar
Cada usuario puede puntuar un lugar solo una vez.
Descripción: Esta regla garantiza que los usuarios no puedan inflar las puntuaciones de manera artificial.

##### R.N.05. Actualización Dinámica de Ranking de Lugares
El ranking de los sitios turísticos debe actualizarse dinámicamente en función de la puntuación promedio otorgada por los usuarios.
Descripción: Esta regla garantiza que los lugares más  populares suban en el ranking, incentivando que los usuarios compartan experiencias actuales. Las puntuaciones más antiguas tendrán un menor impacto en el ranking.

##### R.N.06. Restricciones de Puntuación de Usuarios
Un usuario no podrá puntuar ni reseñar un lugar si no ha pasado al menos 24 horas desde su registro en la plataforma.
Descripción: Esta regla evita la creación de cuentas falsas o de último minuto para manipular las puntuaciones o publicar reseñas sin una experiencia válida. Solo los usuarios que hayan estado registrados durante al menos un día pueden dejar comentarios y calificaciones.


### 4.2. Mapa de historias de usuario
#### Actividades principales:

##### Registro y Autenticación
Como turista, quiero registrarme con mi correo electrónico o número de teléfono para acceder a la aplicación.

##### Exploración de Lugares
Como turista, quiero ver un listado de los lugares más populares para conocer los sitios mejor valorados.
Como turista, quiero buscar lugares cercanos a mi ubicación para planificar mis visitas.

##### Interacción con el Contenido
Como turista, quiero dejar reseñas y puntuaciones de los lugares que visito para compartir mis experiencias con otros usuarios.
Como turista, quiero visualizar un mapa interactivo que muestre los lugares que he visitado y sus reseñas.

##### Gestión de Contenido (para administradores)
Como administrador, quiero moderar las reseñas para asegurar la calidad del contenido.
Como administrador, quiero actualizar la información sobre los lugares para mantener la base de datos actualizada.

### 4.3. Requisitos no funcionales

#### R.N.F. 01. Disponibilidad Multiplataforma
Como usuario, quiero que la aplicación funcione en dispositivos móviles (iOS y Android) y en navegadores web para poder acceder a ExploraCultura desde cualquier dispositivo.

#### R.N.F. 02. Seguridad de Datos
Como usuario, quiero que mis datos personales estén protegidos contra accesos no autorizados para garantizar la privacidad y seguridad de mi información.

#### R.N.F. 03. Usabilidad
Como usuario, quiero que la interfaz de la aplicación sea intuitiva y fácil de navegar para que pueda encontrar rápidamente lo que busco sin complicaciones.

##### R.N.F.04. Reseñas Detalladas y Relevantes
Para que una reseña sea válida, debe cumplir con un mínimo de contenido: al menos 100 caracteres de texto, junto con la opción de añadir fotos o videos como evidencia de la visita.
Descripción: Esta regla garantiza que las reseñas sean suficientemente detalladas y útiles para otros usuarios. Además, el contenido multimedia refuerza la autenticidad de la experiencia descrita.


## 5. Modelo conceptual

### 5.1. Diagramas de clases UML

- con restricciones.
![image](https://github.com/user-attachments/assets/7e65bc7f-ec30-4e8c-a2f7-c86a3152705d)






### 5.2. Escenarios de prueba
 - Hacemos distintos casos de prueba para probar que funcionan correctamente las restricción:

   NUEVOS USUARIOS:
   
 - Primero incluimos casos favorables que no hacen saltar ninguna excepción.
 - Incluimos un turista con un correo o bien un teléfono que ya se había registrado antes, debe salta un error.
 - Incluimos una contraseña que sea inválida, debe saltar un error.
 - Un usuario no verificado.
 - Un usuario con la geolocalización no activada.
 - 

    NUEVAS RESEÑAS:
   
 - Primero incluimos casos favorables que no hacen saltar ninguna excepción.
 - Con un turista que no existe.
 - Con un lugar que no existe.
 - La puntuación no está entre los valores 1 y 5.
 - El contenido de la reseña con menos de 10 caracteres.

    NUEVAS VISITAS:
 - Primero incluimos casos favorables que no hacen saltar ninguna excepción.
 - Inserción con turista que no existe.
 - Lugar que no existe.
 - Registro repetido, incumple criterio de unicidad.
 - La fecha es posterior a la fecha actual.


## 6. Matrices de trazabilidad

- Matriz de trazabilidad entre los elementos del modelo conceptual y los requisitos.

![image](https://github.com/user-attachments/assets/37879996-6baa-4bf1-81ef-199605be12a8)





- Incluir Reglas de negocio — Constraints/Triggers en las matrices de trazabilidad para el entregable 3

![image](https://github.com/user-attachments/assets/bb0c0474-4cad-457e-8b55-93022062c8f0)


  



## 7. Modelo relacional en 3FN

Turista(!id,
    lugarId,
    correo,
    telefono,
    contrasena,
    nombre,
    fechaRegistro,
    verificado,
    geolocalizacionActiva)

Lugar(!id,
    eventoId,
    turistaId,
    nombre,
    descripcion,
    direccion,
    categoria,
    rangoEdad,
    multimedia,
    estaFiltrado )

Evento(!id,
    nombre,
    fechaInicio,
    fechaFin,
    descripcion)

ComercioLocal(!id,
    horario, 
    enlaceWeb)

Reseña(!id,
    turistaId,
    lugarId,
    puntuacion,
    contenido,
    fecha,
    multimedia,
    estaFiltrado)


### 7.1.  Justificación de la estrategia de transformación de jerarquías

- Hay una jerarquía en el modelo conceptual de nuestro proyecto. Para la transformación en modelo relacional hemos hecho una relación para cada clase de la jerarquía (lugar y comercioLocal, una relación para cada subclase concreta (comercioLocal) y una única relación para toda la jerarquía (lugar).
- Nos hemos asegurado de que la PRIMARY KEY de comercioLocal (subclase) sea el id de Lugar (su PRIMARY KEY), para transformar de forma adecuada así la jerarquía.


## Referencias
