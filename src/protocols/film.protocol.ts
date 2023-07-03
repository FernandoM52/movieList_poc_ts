export type Film = {
  id: number;
  name: string;
  genre: string;
  streaming: string;
  current_status: string;
  note: number;
  created_at: string;
}

export type CreatFilmBody = Omit<Film, "id" | "created_at">