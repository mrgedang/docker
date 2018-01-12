## Godbapp

With go and mongo image, this compose will build dummy counters and simple restful for storing user data. Already have feature for add and remove an item from a nested array. For example, the item on a shopping cart user.

```
type Users struct {
	Id bson.ObjectId `bson:"_id,omitempty" json:"id"`
	Nama string `bson:"nama" json:"nama"`
	Kota string `bson:"kota" json:"kota"`
	Keranjang []Keranjang `bson:"keranjang" json:"keranjang"`
}

type Keranjang struct {
	IdBarang bson.ObjectId `bson:"_id,omitempty" json:"id"`
	NamaBarang string `bson:"namaBarang" json:"namaBarang"`
	HargaBarang string `bson:"hargaBarang" json:"hargaBarang"`
}
```

Http method implementation : 
```
	r.HandleFunc("/api/counter", api.CheckCounter).Methods("GET")
	r.HandleFunc("/api/users", api.CreateUser).Methods("POST")
	r.HandleFunc("/api/users/{id}", api.GetUser).Methods("GET")
	r.HandleFunc("/api/users/{id}", api.DeleteUser).Methods("DELETE")
	r.HandleFunc("/api/users/{iduser}/{idbarang}", api.DelBarang).Methods("DELETE")
	r.HandleFunc("/api/users/{id}", api.AddBarang).Methods("POST")
	r.HandleFunc("/api/users", api.GetAllUser).Methods("GET")
```
---

**How to run this code?**
```
~ docker-compose build
~ docker-compose up -d
```

**Check the counter**

![Check the counter](https://i.imgur.com/ZM8UbxG.png)

**Create new user**

![Create new user](https://i.imgur.com/tiIZ5r3.png)

**Get user by id**

![Get user by id](https://i.imgur.com/07xJq1z.png)

**Delete user**

![Delete a user](https://i.imgur.com/NyWcBFC.png)


---
**Sample shopping cart operation**
---

**User select an item**

![Add an item to shopping cart](https://i.imgur.com/5LTLvZu.png)

**User remove an item from shopping cart**

![Remove an item to shopping cart](https://i.imgur.com/C2CytgC.png)

**Add multiple items to a user**

![Form of json data after add item multiple times](https://i.imgur.com/S9Zq4Ks.png)
