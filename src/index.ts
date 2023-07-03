import express, { json } from "express";
import route from "./routers/index.routes";

const app = express();
app.use(json());
app.use(route);

const port = +process.env.PORT || 5000;
app.listen(port, () => console.log(`Server is up and running on port ${port}`));