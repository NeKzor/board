USE board;

-- Chapters

DELETE FROM chapters;

INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (1, 'Campaign', 0);

-- Maps

DELETE FROM maps;

INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (1, 1, 1, 'Stage Collapse', 'tm_intro_01', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (12, 12, 12, 'Time Machine Intro', 'tm_training_01b', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (2, 2, 2, 'Teamwork', 'tm_map_01b', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (11, 11, 11, 'Robots', 'tm_scene_map-update2', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (3, 3, 3, 'Redirection', 'tm_map_02b', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (4, 4, 4, 'Triple Play', 'tm_map_03b', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (5, 5, 5, 'Delivery', 'tm_map_04a', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (6, 6, 6, 'Up and Over', 'tm_map_05a-update2', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (7, 7, 7, 'Chandelier', 'tm_map_06a', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (8, 8, 8, 'Trail Blazer', 'tm_map_07', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (9, 9, 9, 'Help Yourself', 'tm_map_08', 'time', 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (10, 10, 10, 'Back in Time', 'tm_map_final', 'time', 1, 0, 0);

DELETE FROM evidence_requirements;

INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (1 ,80, 1, 0, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (2 ,100, 1, 1, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (3 ,200, 1, 0, 1, '2021-11-27 23:18:38', NULL);
