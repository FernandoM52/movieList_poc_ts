import { CreatFilmBody, Film } from "../protocols/film.protocol";
import * as filmsRepository from "../repositories/films.repository";

export async function createFilm(film: CreatFilmBody) {
  await filmsRepository.createFilm(film);
}

export async function getFilms(genre: string, streaming: string) {
  const filmsResult = await filmsRepository.getFilms(genre, streaming);
  return filmsResult.rows;
}

export async function getFilmById(id: number) {
  const film = await filmsRepository.getFilmById(id);
  return film;
}

export async function updateFilm(id: number, film: CreatFilmBody) {
  await filmsRepository.updateFilm(id, film);
}

export async function deleteFilm(id: number) {
  await filmsRepository.deleteFilm(id);
}