CREATE TABLE "Staff" (
"staff_id" SERIAL PRIMARY KEY,
"first_name" VARCHAR(100),
"last_name" VARCHAR(100)
);

CREATE TABLE "Payment" (
"payment_id" SERIAL PRIMARY KEY,
"payment_type" VARCHAR(100),
"is_default" BOOLEAN,
FOREIGN KEY ("staff_id") REFERENCES "Staff"("staff_id")
);

CREATE TABLE "Movies" (
"movie_id" SERIAL PRIMARY KEY,
"name" VARCHAR(100),
"genre" VARCHAR(100),
"runtime" INTEGER
);

CREATE TABLE "Tickets" (
"ticket_id" SERIAL PRIMARY KEY,
"price" NUMERIC(4,2),
"movie_id" INTEGER,
FOREIGN KEY ("movie_id") REFERENCES "Movies"("movie_id")
);

CREATE TABLE "Concessions" (
"concession_id" SERIAL PRIMARY KEY,
"category" VARCHAR(100),
"price" NUMERIC(4,2)
);

CREATE TABLE "Seats" (
"seat_id" SERIAL PRIMARY KEY,
"is_dirty" BOOLEAN,
"movie_id" INTEGER,
FOREIGN KEY("movie_id") REFERENCES "Movies"("movie_id")
);

CREATE TABLE "Customers" (
"customer_id" SERIAL PRIMARY KEY,
"first_name" VARCHAR(100),
"last_name" VARCHAR(100),
"payment_id" INTEGER,
"concession_id" INTEGER,
"ticket_id" INTEGER,
FOREIGN KEY ("payment_id") REFERENCES "Payment"("payment_id"),
FOREIGN KEY ("concession_id") REFERENCES "Concessions"("concession_id"),
FOREIGN KEY ("ticket_id") REFERENCES "Tickets"("ticket_id")
);

INSERT INTO "Movies" (
	"movie_id",
	"name",
	"genre",
	"runtime",
) VALUES (1, 'Knives Out', 'Mystery', 130), (2, 'Jurassic Park', 'Action', 127);

INSERT INTO "Movies" ("movie_id", "name","genre", "runtime") VALUES (3, 'It', 'Horror', 135);

SELECT * FROM "Movies";

INSERT INTO "Seats" (
	"seat_id",
	"is_dirty",
	"movie_id"
) VALUES (1, False, 1), (2, True, 1), (3, False, 1), (4, False, 1), (5, False, 1), (6, True, 1), (7, False, 1), (8, True, 1), 
(9, True, 2), (10, True, 2), (11, False, 2), (12, False, 2), (13, True, 2), (14, False, 2), (15, False, 2), (16, False, 2),
(17, False, 3), (18, False, 3), (19, False, 3), (20, False, 3), (21, False, 3), (22, False, 3), (23, False, 3), (24, False, 3);

SELECT * FROM "Seats"
ORDER BY "Seats";

UPDATE "Seats"
SET "is_dirty" = True
WHERE "movie_id" IN (
	SELECT "movie_id"
	FROM "Movies"
	WHERE "genre" = 'Horror'
);

INSERT INTO "Tickets" (
	"ticket_id",
	"price",
	"movie_id"
) VALUES (1, 15.99, 1), (2, 15.99, 1), (3, 15.99, 1), (4, 19.99, 2), (5, 12.99, 3);

SELECT * FROM "Tickets";

INSERT INTO "Concessions" (
	"concession_id",
	"category",
	"price"
) VALUES (1, 'Popcorn', 8.99), (2, 'Soda', 4.99), (3, 'Milk Duds', 2.99);

SELECT * FROM "Concessions"

INSERT INTO "Staff" (
	"staff_id",
	"first_name",
	"last_name"
) VALUES (1, 'Mike', 'N`Ike'), (2, 'Brother', 'John'), (3, 'Ryan', 'CountryRhoades');

SELECT * FROM "Staff"

INSERT INTO "Payment" (
	"payment_id",
	"payment_type",
	"is_default",
	"staff_id"
) VALUES (1, 'Credit Card', False, 2), (2, 'Debit Card', True, 2), (3, 'Cash', True, 1);

SELECT * FROM "Payment";

INSERT INTO "Customers" ("customer_id", "first_name", "last_name", "payment_id", "ticket_id") VALUES (1, 'Mega', 'Tron', 1, 1);

INSERT INTO "Customers" ("customer_id", "first_name", "last_name", "payment_id", "concession_id", "ticket_id") VALUES (2, 'Jerry', 'Seinfeld', 2, 2, 1);

SELECT * FROM "Customers"