/*---CREANDO LAS TABLAS Y RELACIONES---*/
CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "user_name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "image" varchar NOT NULL,
  "status" boolean NOT NULL DEFAULT false,
  "created_at" timestamp NOT NULL DEFAULT 'now()',
  "updated_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "posts" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "content" text NOT NULL,
  "image" varchar,
  "created_at" timestamp NOT NULL DEFAULT 'now()',
  "updated_at" timestamp NOT NULL DEFAULT 'now()',
  "status" boolean NOT NULL DEFAULT false,
  "user_id" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "comment" varchar NOT NULL,
  "email" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()',
  "updated_at" timestamp NOT NULL DEFAULT 'now()',
  "status" boolean NOT NULL DEFAULT false,
  "post_id" int NOT NULL
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

---------------------------------------------------------------------------------------------------------------------------
/*---AGREGANDO DATOS DE USUARIOS---*/
insert into users (
	name,
	last_name,
	user_name,
	email,
	password,
	image
) values (
	'Daniel',
	'Jimenez',
	'dani79',
	'daniel@mail.com',
	'root123',
	'https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80'
),

(
	'Jose',
	'Fernandez',
	'pepe123',
	'jose@mail.com',
	'abc',
	'https://images.unsplash.com/photo-1590086782957-93c06ef21604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
),
(
	'Karina',
	'Castro',
	'castro_98',
	'karina@mail.com',
	'123',
	'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'
);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*--AGREGANDO POSTS---*/
insert into posts (
	title,
	content,
	user_id,
	category_id 

) values (
	'La secci??n ??urea',
	'??Qu?? significa la secci??n ??urea?
La proporci??n ??urea es un n??mero irracional que descubrieron pensadores de la Antig??edad, no como una expresi??n aritm??tica, sino como proporci??n entre dos segmentos de una recta. Esa proporci??n puede hallarse tanto en figuras geom??tricas como en la naturaleza (flores, hojas, etc.)',
	1,
	3

),
(
	'Ciudad de Roma',
	'Roma es una ciudad italiana, capital de la regi??n del Lacio y de Italia. Con una poblaci??n de 2 815 951 habitantes,??? es el municipio m??s poblado de Italia y la tercera ciudad m??s poblada de la Uni??n Europea.??? Por antonomasia, se la conoce desde la Antig??edad como la Urbe (Urbs).',
	3,
	2


),(
	'Primer teorema fundamental del c??lculo',
	' Esto significa que toda funci??n acotada e integrable (siendo continua o discontinua en un n??mero finito de puntos) verifica que la derivada de su integral es igual a ella misma. Este teorema es central en la rama de las matem??ticas denominada an??lisis matem??tico o c??lculo infinitesimal.',
	3,
	3
);
---------------------------------------------------------------------------------------
/*----AGREGANDO CATEGORIAS---*/
insert into categories (
	name
) values (
	'ciencia ficci??n'),
	('historia'),
	('matem??ticas');
------------------------------------------------------------------------------------------
/*---AGREGANDO COMENTARIOS---*/
insert into "comments" (
	comment,
	email,
	post_id 

) values (
	'Excelente art??culo, me gustar??a saber m??s',
	'carlos@mail.com',
	1
	
),(
	'Me gusta la historia de Roma',
	'chavez@gmail.com',
	2
),(
	'Me gusta la geometr??a y su aplicaci??n a las artes y construcciones',
	'mat@mail.com',
	1

)