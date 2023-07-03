import pg from "pg";
import dotenv from "dotenv";

dotenv.config();

const { Pool } = pg;

const db = new Pool({
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "Fer@M52", //Alterar para postgres
  database: "films_ts_poc"
});

export { db };