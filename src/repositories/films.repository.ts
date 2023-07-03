import { CreatFilmBody, Film } from "../protocols/film.protocol";
import { db } from "../database/db.connection";

export async function createFilm(film: CreatFilmBody) {
  const query = `
    INSERT INTO films (name, genre, streaming, current_status, note)
    VALUES ($1, $2, $3, $4, $5)
  `;
  return await db.query(query, [film.name, film.genre, film.streaming, film.current_status, film.note]);
}

export async function getFilms(genre: string, streaming: string) {
  let queryParams = [];
  let query = `
      SELECT films.*, COUNT(films) from films
      JOIN genres ON genres.name = films.genre
      JOIN streamings ON streamings.name = films.streaming
    `;

  if (genre && streaming) {
    query += `WHERE films.genre = $1 AND films.streaming = $2`;
    queryParams.push(genre, streaming);
  } else if (genre) {
    query += `WHERE films.genre = $1`;
    queryParams.push(genre);
  } else if (streaming) {
    query += `WHERE films.streaming = $1`;
    queryParams.push(streaming);
  }

  query += `GROUP BY films.id`;

  return await db.query(query, queryParams);
}

export async function getFilmById(id: number) {
  const query = `SELECT * FROM films WHERE id = $1`;
  const result = await db.query(query, [id]);

  return result.rows[0];
}

export async function updateFilm(id: number, film: CreatFilmBody) {
  const query = `
    UPDATE films SET name = $1, genre = $2, streaming = $3, current_status = $4, note = $5
    WHERE id = $6
  `;
  return await db.query(query, [film.name, film.genre, film.streaming, film.current_status, film.note, id]);
}

export async function deleteFilm(id: number) {
  const query = `DELETE FROM films WHERE id = $1`;
  return await db.query(query, [id]);
};
