import express, { Request, Response, Router } from "express";
import { AppDataSource } from "./app";
import { User } from "./entities/User";

const router = Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const userRepo = AppDataSource.getRepository(User);
    const allUsers = await userRepo.find();
    res.json(allUsers);
  } catch (error) {
    console.error("Error fetching users:", error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

router.get("/add", async (req: Request, res: Response) => {
  try {
    const userRepo = AppDataSource.getRepository(User);
    let user: User = new User();
    user.firstName = "Sarthak";
    user.lastName = "Gautam";
    user.email = "sgautam@mail.com";

    const record = await userRepo.save(user);
    res.status(201).json(record);
  } catch (error) {
    console.error("Error adding user:", error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

router.patch("/:id", async (req: Request, res: Response) => {
  try {
    const userRepository = AppDataSource.getRepository(User);
    const id = parseInt(req.params.id);
    const user = await userRepository.findOneBy({ id });

    if (!user) {
      res.status(404).json({ message: "User not found" });
    } else {
      user.firstName = req.body.firstName || user.firstName;
      user.lastName = req.body.lastName || user.lastName;
      user.email = req.body.email || user.email;

      const updatedUser = await userRepository.save(user);
      res.json(updatedUser);
    }
  } catch (error) {
    console.error("Error updating user:", error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

router.delete("/:id", async (req: Request, res: Response) => {
  try {
    const userRepository = AppDataSource.getRepository(User);
    const id = parseInt(req.params.id);
    const result = await userRepository.delete(id);

    if (result.affected === 0) {
      res.status(404).json({ message: "User not found" });
    }

    res.status(204).send(); // No content
  } catch (error) {
    console.error("Error deleting user:", error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

export default router;
