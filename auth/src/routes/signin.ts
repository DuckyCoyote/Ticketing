import express from "express";

const router = express.Router();

router.get("/api/user/signin", (req, res) => {
  res.send("Hi there!");
});

export { router as signInRouter };
