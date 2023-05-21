use iverborg_leaderboard;
create table evidence_requirements
(
    id int auto_increment,
    `rank` int not null,
    demo boolean not null,
    video boolean not null,
    active boolean not null,
    timestamp datetime not null,
    closed_timestamp datetime default null null,
    constraint evidence_requirements_pk
        primary key (id)
);