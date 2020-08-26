const db = require('../data/config');
// find
function find() {
    return db('schemes');
}
// findById(id)
function findById(id) {
    return db('schemes').where({ id }).first();
}
// findSteps(id)
function findSteps(id) {
    return db('steps as ST')
        .innerJoin('schemes as SC', 'SC.id', 'ST.scheme_id')
        .where('ST.scheme_id', id)
        .select('ST.id', 'ST.step_number', 'ST.instructions', 'SC.scheme_name')
        .orderBy('ST.step_number', 'asc');
}
// add(scheme)
function add(scheme) {
    return db('schemes').insert(scheme, '*');
}
// update(changes, id):
function update(changes, id) {
    return db('schemes').where({ id }).update(changes);
}
// remove(id)
function remove(id) {
    return db('schemes').where({ id }).del();
}

//  addStep(step, scheme_id):
function addStep(step, scheme_id) {
    return db('steps').insert({ ...step, scheme_id });
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
    addStep,
};
