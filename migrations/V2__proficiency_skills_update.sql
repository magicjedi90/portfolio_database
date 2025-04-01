alter table skills
    add parent_id integer;

alter type proficiency rename value 'Getting Started' TO 'Beginner';
alter type proficiency add value 'Advanced' before 'Expert';
alter type proficiency rename value 'Proficient' to 'Intermediate';
