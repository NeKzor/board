use board;
alter table users
    add auth_hash varchar(32) default null null;