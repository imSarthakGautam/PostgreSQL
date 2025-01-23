###  Decorators in TypeScript
---
#### What are Decorators?

Decorators are a powerful feature in TypeScript that allow you to **modify or enhance** the behavior of **classes, methods, accessors, properties, and parameters** at **design time**.  

They are special functions that take a **target** (class, method, etc.) as an argument and return a modified version of that target.  

---

### **Before Using Decorators**  
To enable decorators, update the `tsconfig.json` file with:  

```json
{
  "experimentalDecorators": true,
  "emitDecoratorMetadata": true
}
```

---

### **Types of Decorators in TypeScript**  

1. **Class Decorators** – Modify or add behavior to a class.  
2. **Property Decorators** – Add metadata to class properties.  
3. **Method Decorators** – Alter method behavior, e.g., logging or validation.  
4. **Parameter Decorators** – Add metadata to method parameters.

---

### **How to Use Decorators?**  

#### **1. Class Decorator**  
Used to modify class behavior.  

```typescript
function Logger(constructor: Function) {
  console.log(`Class ${constructor.name} is created`);
}

@Logger
class Person {
  constructor() {
    console.log("Person instance created");
  }
}
```

---

#### **2. Property Decorator**  
Used to add metadata to properties.  

```typescript
function LogProperty(target: any, propertyName: string) {
  console.log(`Property ${propertyName} is accessed`);
}

class User {
  @LogProperty
  name: string = "Alice";
}
```

---

#### **3. Method Decorator**  
Used to modify method behavior.  

```typescript
function LogMethod(target: any, methodName: string, descriptor: PropertyDescriptor) {
  console.log(`Method ${methodName} was called`);
}

class Car {
  @LogMethod
  drive() {
    console.log("Car is driving");
  }
}

const myCar = new Car();
myCar.drive();
```

---

#### **4. Parameter Decorator**  
Used to add metadata to method parameters.  

```typescript
function LogParameter(target: any, methodName: string, paramIndex: number) {
  console.log(`Parameter at index ${paramIndex} in method ${methodName} was accessed`);
}

class Product {
  buy(@LogParameter amount: number) {
    console.log(`Buying ${amount} items`);
  }
}

const product = new Product();
product.buy(5);
```

---

### **What are Annotations?**  

Annotations are special tags or markers added to code to provide extra information (metadata) about it.  

**Key Points:**  
- **Metadata:** Annotations contain information about the code but do not modify its behavior directly.  
- **No Direct Impact on Execution:** They provide hints or instructions for tools or frameworks.  
- **Flexibility:** Annotations can be customized for specific needs.  

**Common Uses of Annotations:**  
- Configuration and wiring in frameworks (e.g., Angular, Spring).  
- Code generation tools for boilerplate code.  
- Defining validation rules for data objects.  

---

### **Why Use Decorators?**  

- To add **metadata** to classes/methods for frameworks (e.g., Angular, TypeORM).  
- To enhance code **reusability** by applying the same logic across components.  
- To perform **logging, validation, and dependency injection.**  

---

### **Who Uses Decorators?**  

- **Frameworks:** Angular (`@Component`), NestJS, TypeORM (`@Entity`).  
- **Tools:** Logging, authorization, performance tracking.  

---

### **When Are Decorators Executed?**  

Decorators are executed **at the time of class definition**, not when the class is instantiated.  

---
