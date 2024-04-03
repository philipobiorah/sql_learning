--creating new ..... favourites.db
sqlite3 favorites.db    


--put sqlite into csv mode
sqlite> .mode csv  


---import favorites.csv into the new favorites  table     

--get out of sqlite
sqlite> .quite


--now you should have both favorites.csv and favorites.db


--- to view the schema
sqlite3 favorites.db
.schema  



CREATE TABLE IF NOT EXISTS "favorites"(
    "Timestamp" TEXT, "language" TEXT, "problem" TEXT);


SELECT columns FROM table;
...

SELECT * FROM favorites;