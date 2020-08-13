const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("steps as s")
    .join("schemes as i", "s.scheme_id", "i.id")
    .select("s.step_number", "s.instructions", "i.scheme_name");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .returning("id")
    .then(ids => {
      return findById(ids[0]);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(count => {
      return findById(id);
    });
}

function remove(id) {
  return db("schemes").where({ id }).del();
}
