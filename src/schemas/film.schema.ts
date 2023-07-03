import Joi from "joi";
import { CreatFilmBody } from "protocols/film.protocol";

export const postSchema = Joi.object<CreatFilmBody>({
  name: Joi.string().trim().required(),
  genre: Joi.string().trim().required(),
  streaming: Joi.string().trim().required(),
  current_status: Joi.string().valid("Assistido", "Não assistido").required(),
  note: Joi.number().required()
});