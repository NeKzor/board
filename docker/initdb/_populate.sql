USE board;

-- Chapters

DELETE FROM chapters;

INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (1, 'Single Player', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (2, 'Cooperative', 0);

-- Maps

DELETE FROM maps;

INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (1, 1, 1, "Human Storage Vault", "sp_a1_pr_map_001", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (2, 2, 2, "Time Travel", "sp_a1_pr_map_002", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (3, 3, 3, "Cubes And Buttons", "sp_a1_pr_map_003", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (4, 4, 4, "Portals", "sp_a1_pr_map_004", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (5, 5, 5, "Time Portals", "sp_a1_pr_map_005", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (6, 6, 6, "Timing Tests", "sp_a1_pr_map_006", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (7, 7, 7, "Lasers", "sp_a1_pr_map_007", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (8, 8, 8, "Aerial Faithplates", "sp_a1_pr_map_008", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (9, 9, 9, "Lightbridges", "sp_a1_pr_map_009", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (10, 10, 10, "Turrets", "sp_a1_pr_map_010", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (11, 11, 11, "Exursion Funnels", "sp_a1_pr_map_011", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (12, 12, 12, "Finale", "sp_a1_pr_map_012", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (13, 13, 13, "Start", "mp_coop_start", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (14, 14, 14, "End", "mp_coop_end", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (15, 15, 15, "Lobby", "mp_coop_lobby_3", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (16, 16, 16, "Bridge", "mp_coop_pr_bridge", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (17, 17, 17, "Bts", "mp_coop_pr_bts", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (18, 18, 18, "Catapult", "mp_coop_pr_catapult", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (19, 19, 19, "Cubes", "mp_coop_pr_cubes", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (20, 20, 20, "Fling", "mp_coop_pr_fling", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (21, 21, 21, "Laser", "mp_coop_pr_laser", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (22, 22, 22, "Loop", "mp_coop_pr_loop", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (23, 23, 23, "Portals", "mp_coop_pr_portals", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (24, 24, 24, "Tbeam", "mp_coop_pr_tbeam", "time", 2, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (25, 25, 25, "Teamwork", "mp_coop_pr_teamwork", "time", 2, 1, 0);

DELETE FROM evidence_requirements;

INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (1 ,80, 1, 0, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (2 ,100, 1, 1, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (3 ,200, 1, 0, 1, '2021-11-27 23:18:38', NULL);
