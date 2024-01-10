import express, { Request, Response } from "express";
import { body } from 'express-validator'
import jwt from 'jsonwebtoken'

import { Password } from "../services/password";
import { User } from "../models/user";
import { validateRequest } from "../middlewares/validate-request";
import { BadRequestError } from "../errors/bad-request-error";

const router = express.Router();

router.post("/api/user/signin", [
  body("email").isEmail().withMessage("Email must be valid"),
  body("password")
    .trim()
    .notEmpty()
    .isLength({ min: 4, max: 20 })
    .withMessage("Password must be 4 and 20 characters"),
],
  validateRequest,
  async (req: Request, res: Response) => {
    const { email, password } = req.body;

    const existingUser = await User.findOne({ email: email });
    if (!existingUser) {
      throw new BadRequestError('Invalid Credentials');
    };

    const passwordsMatch = await Password.compare(existingUser.password, password);

    if (!passwordsMatch) {
      throw new BadRequestError('Invlid Credentials');
    }

    // Generate JWT
    const userJwt = jwt.sign(
      {
        id: existingUser.id,
        email: existingUser.email,
      },
      process.env.JWT_KEY as string,
    );

    // Store it on session object
    req.session = {
      jwt: userJwt,
    };

    res.status(201).send(existingUser);

  });

export { router as signInRouter };
