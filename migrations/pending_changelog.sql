use iverborg_leaderboard;
alter table changelog
    add pending boolean default false not null;