const express = require("express");
const app = express();
const morgan = require("morgan");
const client = require("./db");

app.use(morgan("dev"));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

app.get("/", async (req, res, next) => {
  try {
    const query = "select users.* from users";
    const data = await client.query(query);
    res.json(data.rows);
  } catch(err) {
    next(err);
  }
});

app.get("/:id", async (req, res, next) => {
  try {
    const query = "select users.* from users where users.id = $1";
    const data = await client.query(query, [req.params.id]);

    if (!data.rows.length) {
      const new404 = new Error("Page not found");
      new404.status = 404;
      throw new404;
    }

    res.json(data.rows[0]);
  } catch(err) {
    next(err);
  }
});

app.post("/", (req, res, next) => {
  console.log("req.body is alive", req.body);

  res.sendStatus(201);
});

app.use((err, req, res, next) => {
  if (err.status === 404) {
    console.error(err);
    res.status(404).send("You fugged up my dude");
  } else res.send("Server fugged");
});

const PORT = 3030;

app.listen(PORT, () => {
  console.log("App listening on port " + PORT);
});



