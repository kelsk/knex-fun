/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> } 
 */
exports.seed = async function(knex) {
  await knex('jokes').insert([
    {id: 3, setup: 'how many devs does it take to run a Cloud Run Job?', punchline: 'idk Cloud Run Jobs is in alpha and we do not have that documentation'}
  ]);
};
