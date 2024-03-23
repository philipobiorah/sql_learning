--creating favourites.db
sqlite3 favorites.db


--put sqlite into csv mode
sqlite> .mode csv  


---import favorites.csv into the new favorites    [.db]
sqlite> .import favorites.csv favorites

--get out of sqlite
sqlite> .quite


--now you should have both favorites.csv and favorites.db

