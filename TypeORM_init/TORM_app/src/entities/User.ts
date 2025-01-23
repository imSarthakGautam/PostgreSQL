import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  firstName: string;

  @Column()
  lastName: string;

  @Column()
  email: string;
}

/**
 * In TypeORM you have to initialize every class you create
 * so either enable it by  setting it required as -->id!:
 * or by disabling strictProperty Initialization in tsconfig.json
 *
 * Strict property initialization is a compiler option in TypeScript
 * that enforces the initialization of all class properties before they are used.
 * This helps prevent potential runtime errors caused by accessing properties that haven't been assigned a value.
 */
