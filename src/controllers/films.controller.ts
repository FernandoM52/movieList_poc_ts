import { Request, Response } from "express";
import { CreatFilmBody } from "../protocols/film.protocol";
import * as filmServices from "../services/films.sevice"
import httpStatus from "http-status";

export async function createFilm(req: Request, res: Response) {
  try {
    const film = req.body as CreatFilmBody;
    await filmServices.createFilm(film);

    res.status(201).send(httpStatus.CREATED);
  } catch (err) {
    console.log(err);
    res.status(500).send(httpStatus.INTERNAL_SERVER_ERROR);
  }
}

export async function getFilms(req: Request, res: Response) {
  const genre = req.query.genre as string;
  const streaming = req.query.streaming as string;

  try {
    const films = await filmServices.getFilms(genre, streaming);
    res.send(films);
  } catch (err) {
    console.log(err);
    res.status(500).send(httpStatus.INTERNAL_SERVER_ERROR);
  }
}

export async function updateFilm(req: Request, res: Response) {
  const { id } = req.params;
  const filmId = parseInt(id)
  const film = req.body as CreatFilmBody;

  try {
    const filmExist = await filmServices.getFilmById(filmId);
    if (!filmExist) return res.status(404).send(httpStatus.NOT_FOUND);

    await filmServices.updateFilm(filmId, film);

    res.status(200).send(httpStatus.OK);
  } catch (err) {
    res.status(500).send(httpStatus.INTERNAL_SERVER_ERROR);
  }
}

export async function deleteFilm(req: Request, res: Response) {
  const { id } = req.params;

  try {
    const filmExist = await filmServices.getFilmById(parseInt(id));
    if (!filmExist) return res.status(404).send(httpStatus.NOT_FOUND);

    await filmServices.deleteFilm(parseInt(id));

    res.status(203).send(httpStatus.OK);
  } catch (err) {
    console.log(err);
    res.status(500).send(httpStatus.INTERNAL_SERVER_ERROR);
  }
}