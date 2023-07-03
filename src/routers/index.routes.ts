import { Router } from "express";
import filmRoute from "./films.routes";

const route = Router();
route.use(filmRoute);

export default route;