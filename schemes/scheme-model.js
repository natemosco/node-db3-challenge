const db = require("../data/db_config.js");

module.exports = {
  find,
  findById,
  add,
  update,
  remove,
  findSteps,
  addStep
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where("id", "=", id)
    .first();
}

function add(scheme) {
  return db("schemes").insert(scheme);
}

function remove(id) {
  return db("schemes")
    .where("id", "=", id)
    .del();
}

function update(changes, id) {
  return db("schemes")
    .where("id", "=", id)
    .update(changes);
}

function findSteps(id) {
  return db
    .select("*")
    .from("steps")
    .join("schemes", "steps.scheme_id", "=", "schemes.id");
}

function addStep(step, scheme_id) {
  console.log(scheme_id, step, step.step_number);

  return db("steps").insert({
    scheme_id: scheme_id,
    step_number: step.step_number,
    instructions: step.instructions,
    scheme_name: step.scheme_name
  });
}
