create table football_clubs(
    club_id integer primary key,
    club_name varchar(100) not null,
    city varchar(100) not null,
    country varchar(100) not null,
    founded_year integer
);

create table teams(
    team_id integer primary key,
    team_name varchar(100) not null,
    club_id integer,
    group_id integer,
    coach_name varchar(100),
    foreign key (club_id) references football_clubs(club_id),
    foreign key (group_id) references tournament_groups(group_id)
);


create table tournaments(
    tournament_id integer primary key,
    tournament_name varchar(100) not null,
    start_date date not null,
    end_date date not null,
    status varchar(20) not null
);


create table tournament_groups(
    group_id integer primary key,
    group_name varchar(100) not null,
    tournament_id integer not null,
    created_at timestamp,
    foreign key (tournament_id) references tournaments(tournament_id)
);



create table match_fixtures(
    match_id integer primary key,
    match_date timestamp not null,
    venue varchar(100),
    home_team_id integer,
    away_team_id integer,
    home_score integer,
    away_score integer,
    tournament_id integer,
    match_status varchar(20),
    foreign key (home_team_id) references teams(team_id),
    foreign key (away_team_id) references teams(team_id),
    foreign key (tournament_id) references tournaments(tournament_id)
);

create table players(
    player_id integer primary key,
    full_name varchar(100) not null,
    date_of_birth date not null,
    position varchar(50) not null,
    team_id integer,
    jersey_number integer,
    foreign key (team_id) references teams(team_id)
);

insert into football_clubs (club_id, club_name, city, country, founded_year)
values 
(1, 'Real Madrid', 'Madrid', 'Spain', 1902),
(2, 'Barcelona', 'Barcelona', 'Spain', 1899);
insert into tournaments (tournament_id, tournament_name, start_date, end_date, status)
values
(1, 'La Liga', '2025-08-01', '2026-05-15', 'ongoing'),
(2, 'Champions League', '2025-09-10', '2026-06-01', 'upcoming');
insert into tournament_groups (group_id, group_name, tournament_id, created_at)
values
(1, 'Group A', 1, now()),
(2, 'Group B', 1, now());
insert into teams (team_id, team_name, club_id, group_id, coach_name)
values
(1, 'Real Madrid', 1, 1, 'Carlo Ancelotti'),
(2, 'Barcelona', 2, 2, 'Xavi Hernandez');
insert into players (player_id, full_name, date_of_birth, position, team_id, jersey_number)
values
(1, 'Vinicius Jr', '2000-07-12', 'Forward', 1, 7),
(2, 'Pedri', '2002-11-25', 'Midfielder', 2, 8);
insert into match_fixtures (match_id, match_date, venue, home_team_id, away_team_id, home_score, away_score, tournament_id, match_status)
values
(1, '2025-09-15 20:00:00', 'Santiago Bernabeu', 1, 2, 3, 1, 1, 'finished');
select * from football_clubs;
select * from tournaments;
select * from tournament_groups;
select * from teams;
select * from players;
