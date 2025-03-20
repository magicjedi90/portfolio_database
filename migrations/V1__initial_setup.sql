CREATE TYPE proficiency AS ENUM ('Getting Started', 'Proficient', 'Expert');

create table skills
(
    id                serial
        constraint skills_pk
            primary key,
    name              varchar(250),
    description       varchar(2500),
    official_site_url varchar(2048),
    proficiency       proficiency
);

create table jobs
(
    id               serial
        constraint jobs_pk
            primary key,
    start_date       date,
    end_date         date,
    is_current_job   bool,
    company_name     varchar(250),
    company_website  varchar(2048),
    description      varchar(2500),
    roles            varchar(2500),
    responsibilities varchar(2500)
);

create table projects
(
    id          serial
        constraint projects_pk
            primary key,
    name        varchar(100),
    description varchar(2500),
    github_url  varchar(2048),
    job_id      integer,
    constraint projects_jobs_id_fk
        foreign key (job_id) references jobs (id)
            on delete cascade
);

create table projects_skills
(
    id         serial
        constraint projects_skills_pk
            primary key,
    project_id integer
        constraint projects_skills_projects_id_fk
            references projects (id)
            on delete cascade,
    skill_id   integer
        constraint projects_skills_skills_id_fk
            references skills (id)
            on delete cascade
);