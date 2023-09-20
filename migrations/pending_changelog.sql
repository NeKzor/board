use board;
alter table changelog
    add pending boolean default false not null;