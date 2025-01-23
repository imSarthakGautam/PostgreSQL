# **TypeORM in NodeJs**  

## **What is TypeORM?**
  
TypeORM is a powerful **Object-Relational Mapping (ORM)** library for TypeScript and JavaScript that allows interacting with relational databases like **MySQL, PostgreSQL, SQLite, and SQL Server** using object-oriented programming principles.  

---

## **Why Use TypeORM?**  

- **Abstraction:** Provides an abstraction layer over database drivers.  
- **Decorators:** Use TypeScript decorators to define schema, reducing boilerplate code.  
- **Migrations:** Easily manage schema changes with migrations.  
- **Cross-DB Support:** Works with multiple databases.  
- **Repositories & QueryBuilder:** Provides built-in methods for easy CRUD operations.  
- **Synchronization:** Auto-generates database schema based on entities.  

---

## **Setting Up TypeORM with TypeScript and Express**  

### **1. Initialize the Node.js Project**  
```bash
npm init -y
npm install express
```  

---

### **2. Install Dependencies**  

```bash
npm install typeorm reflect-metadata pg
npm install --save-dev ts-node typescript nodemon @types/express
```  

**Explanation:**  
- `typeorm` – ORM library  
- `reflect-metadata` – Required for decorators  
- `pg` – PostgreSQL driver (replace with `mysql2` or others)  
- `ts-node`, `typescript`, `nodemon` – Development dependencies  

---

### **3. Configure TypeScript (`tsconfig.json`)**  

Modify the `tsconfig.json` file:  

```json
{
  "compilerOptions": {
    "target": "ES6",
    "module": "CommonJS",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "experimentalDecorators": true,
    "emitDecoratorMetadata": true
  }
}
```

---

### **4. Project Structure**  

```
/typeorm-project
│-- node_modules/
│-- src/
│   │-- entities/
│   │   └── User.ts
│   │-- migrations/
│   │-- data-source.ts
│   │-- index.ts
│-- .env
│-- package.json
│-- tsconfig.json
```  

---

### **5. Define an Entity (Database Table Representation)**  
```typescript
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column({ unique: true })
  email: string;
}
```  

---

### **6. Create a Data Source (Database Connection)**  
```typescript
import { DataSource } from "typeorm";
import { User } from "./entities/User";

export const AppDataSource = new DataSource({
  type: "postgres",
  host: "localhost",
  port: 5432,
  username: "yourusername",
  password: "yourpassword",
  database: "testdb",
  entities: [User],
  synchronize: true,  // Automatically creates tables (disable in production)
  logging: true,
});
```

---

### **7. Initialize Database Connection**  
```typescript
AppDataSource.initialize()
  .then(() => {
    console.log("Database connected successfully!");
  })
  .catch((error) => console.log(error));
```

---

### **8. Running the Project**  

Start the project in development mode:  
```bash
npm run dev
```  

Build the project:  
```bash
npm run build
```  

---

### **9. CRUD Operations using Repositories**  
```typescript
import { AppDataSource } from "./data-source";
import { User } from "./entities/User";

const userRepository = AppDataSource.getRepository(User);

// Create a new user
const newUser = new User();
newUser.name = "Alice";
newUser.email = "alice@example.com";
await userRepository.save(newUser);

// Find users
const users = await userRepository.find();
console.log(users);

// Update a user
await userRepository.update({ id: 1 }, { name: "Updated Alice" });

// Delete a user
await userRepository.delete({ id: 1 });
```

---

### **10. TypeORM Relations (One-to-Many Example)**  
```typescript
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { Post } from "./Post";

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @OneToMany(() => Post, (post) => post.user)
  posts: Post[];
}
```

---

### **11. TypeORM Query Builder Example**  
```typescript
const users = await AppDataSource
  .getRepository(User)
  .createQueryBuilder("user")
  .where("user.name = :name", { name: "Alice" })
  .getMany();
```

---

### **12. TypeORM Migration Commands**  

Instead of `synchronize: true`, use migrations in production.  

```bash
# Generate migration
npx typeorm migration:generate -d src/data-source.ts -n InitialMigration

# Run migration
npx typeorm migration:run -d src/data-source.ts

# Revert last migration
npx typeorm migration:revert -d src/data-source.ts
```

---

## **Key TypeORM Concepts and Decorators**  

| Concept             | Description                                         |
|-------------------- |--------------------------------------------------- |
| **Entity**          | Represents a database table.                        |
| **Repository**      | Provides methods to interact with entities.         |
| **Data Source**     | Configures connection to the database.               |
| **Migration**       | Manages schema changes over time.                    |
| **Relations**       | Defines relationships between tables.                |

### **Common TypeORM Decorators**  

| Decorator                   | Purpose                                       |
|-----------------------------|-----------------------------------------------|
| `@Entity()`                  | Defines a database table.                     |
| `@PrimaryGeneratedColumn()`  | Auto-increment primary key.                    |
| `@Column()`                  | Defines a table column.                        |
| `@OneToOne()`                 | One-to-one relationship.                       |
| `@OneToMany()`                | One-to-many relationship.                      |
| `@ManyToOne()`                | Many-to-one relationship.                      |
| `@ManyToMany()`               | Many-to-many relationship.                     |

---

## **TypeORM vs Other ORMs**  

| Feature              | TypeORM          | Sequelize        | Prisma         |
|---------------------|-----------------|-----------------|---------------|
| Language Support     | TypeScript/JS    | TypeScript/JS    | TypeScript     |
| Decorators           | Yes              | No               | No             |
| Query Builder        | Yes              | Yes              | Yes            |
| Migration Support    | Yes              | Yes              | Yes            |
| Performance         | Good             | Good             | Excellent      |

---

## **Conclusion**  
TypeORM simplifies database management in Node.js projects using a **declarative, object-oriented approach.** By defining entities with decorators, using repositories for queries, and handling schema changes with migrations, it makes development easier and more maintainable.  

---

This optimized crash course provides a comprehensive yet concise revision of TypeORM.