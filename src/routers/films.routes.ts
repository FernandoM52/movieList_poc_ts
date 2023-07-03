import { Router } from "express";
import { validateSchemaMiddleware } from "../middlewares/validateSchema";
import { postSchema } from "../schemas/film.schema";
import * as filmsControlller from "../controllers/films.controller";

const filmRoute = Router();

filmRoute.post("/filmes", validateSchemaMiddleware(postSchema), filmsControlller.createFilm);
filmRoute.get("/filmes", filmsControlller.getFilms);
filmRoute.put("/filmes/:id", validateSchemaMiddleware(postSchema), filmsControlller.updateFilm);
filmRoute.delete("/filmes/:id", filmsControlller.deleteFilm);

export default filmRoute;