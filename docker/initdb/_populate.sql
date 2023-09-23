USE board;

-- Chapters

DELETE FROM chapters;

INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (1, 'Aperture Tag', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (2, 'Speed Gel Upgrade', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (3, 'No More Test Recycling', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (4, 'The Stage', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (5, 'Bonus', 0);

-- Maps

DELETE FROM maps;

INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (1, 1, 1, 'Rest Room', 'gg_intro_wakeup', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (2, 2, 2, 'Paint Intro', 'gg_blue_only', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (3, 3, 3, 'Wall Bounce', 'gg_blue_only_2', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (4, 4, 4, 'Platforms', 'gg_blue_only_3', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (5, 5, 5, 'Funnel Bounce', 'gg_blue_only_2_pt2', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (6, 6, 6, 'Jmooth Sazz', 'gg_a1_intro4', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (7, 7, 7, 'Blue Upplatform', 'gg_blue_upplatform', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (8, 8, 8, 'Red Only', 'gg_red_only', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (9, 9, 9, 'Surf', 'gg_red_surf', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (10, 10, 10, 'Intro', 'gg_all_intro', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (11, 11, 11, 'Rotating Wall', 'gg_all_rotating_wall', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (12, 12, 12, 'Hard Rock', 'gg_all_fizzler', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (13, 13, 13, 'Flow Mechanics', 'gg_all_intro_2', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (14, 14, 14, 'Bolumn Clocker', 'gg_a2_column_blocker', 'time', 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (15, 15, 15, 'Puzzle', 'gg_all_puzzle2', 'time', 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (16, 16, 16, 'Puzzle 2', 'gg_all2_puzzle1', 'time', 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (17, 17, 17, 'Gel Catch', 'gg_all_puzzle1', 'time', 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (18, 18, 18, 'Breakdown', 'gg_all2_escape', 'time', 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (19, 19, 19, 'The Truman Show', 'gg_stage_reveal', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (20, 20, 20, 'Bridge Bounce', 'gg_stage_bridgebounce_2', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (21, 21, 21, 'Speed Crushers', 'gg_stage_redfirst', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (22, 22, 22, 'Laser Relay', 'gg_stage_laserrelay', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (23, 23, 23, 'Citranium', 'gg_stage_beamscotty', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (24, 24, 24, 'Speed Flings', 'gg_stage_bridgebounce', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (25, 25, 25, 'Roof Bounce', 'gg_stage_roofbounce', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (26, 26, 26, 'Funnel Drop', 'gg_stage_pickbounce', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (27, 27, 27, 'Platform Ride', 'gg_stage_theend', 'time', 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (28, 28, 28, 'Tag Remix', 'gg_tag_remix', 'time', 5, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (29, 29, 29, 'Trailer', 'gg_trailer_map', 'time', 5, 0, 0);

DELETE FROM evidence_requirements;

INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (1 ,80, 1, 0, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (2 ,100, 1, 1, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (3 ,200, 1, 0, 1, '2021-11-27 23:18:38', NULL);
