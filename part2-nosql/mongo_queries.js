// Use database
use ecommerce_db;


// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: 101,
    name: "Samsung Smart TV",
    category: "Electronics",
    price: 55000,
    brand: "Samsung",
    specs: {
      screen_size: "55 inch",
      resolution: "4K",
      voltage: "220V"
    },
    warranty: {
      period_years: 2,
      type: "Manufacturer"
    },
    ratings: [4, 5, 5, 3]
  },
  {
    product_id: 201,
    name: "Men's Denim Jacket",
    category: "Clothing",
    price: 2500,
    brand: "Levis",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Denim",
    care_instructions: {
      wash: "Machine wash",
      dry: "Do not tumble dry"
    },
    ratings: [5, 4, 4]
  },
  {
    product_id: 301,
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "5g"
    },
    storage: {
      temperature: "4°C",
      type: "Refrigerated"
    }
  }
]);


// OP2: find() — Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { product_id: 101 },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category field
db.products.createIndex({ category: 1 });

/*
Why index?
- Improves query performance when filtering by category
- Used in OP2 and OP3 frequently
- Avoids full collection scan → faster retrieval
*/