USE board;

-- Chapters

DELETE FROM chapters;

INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (1, '1952', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (2, 'Extended Relaxation', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (3, 'The Ascent', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (4, 'Organic Complications', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (5, 'Intrusion', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (6, '1952', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (7, 'Extended Relaxation', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (8, 'The Ascent', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (9, 'Organic Complications', 0);
INSERT INTO chapters (`id`, `chapter_name`, `is_multiplayer`) VALUES (10, 'Intrusion', 0);

-- Maps

DELETE FROM maps;

INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (1, 1, 1, "Tramride", "st_a1_tramride", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (2, 2, 2, "Mel Intro", "st_a1_mel_intro", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (3, 3, 3, "Lift", "st_a1_lift", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (4, 4, 4, "Garden", "st_a1_garden", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (5, 5, 5, "Destroyed Garden", "st_a2_garden_de", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (6, 6, 6, "Underbounce", "st_a2_underbounce", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (7, 7, 7, "Once Upon", "st_a2_once_upon", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (8, 8, 8, "Past Power", "st_a2_past_power", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (9, 9, 9, "Ramp", "st_a2_ramp", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (10, 10, 10, "Firestorm", "st_a2_firestorm", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (11, 11, 11, "Junkyard", "st_a3_junkyard", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (12, 12, 12, "Concepts", "st_a3_concepts", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (13, 13, 13, "Paint Fling", "st_a3_paint_fling", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (14, 14, 14, "Faith Plate", "st_a3_faith_plate", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (15, 15, 15, "Transition", "st_a3_transition", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (16, 16, 16, "Overgrown", "st_a4_overgrown", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (17, 17, 17, "Funnel Over Goo", "st_a4_tb_over_goo", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (18, 18, 18, "Two Of A Kind", "st_a4_two_of_a_kind", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (19, 19, 19, "Destroyed", "st_a4_destroyed", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (20, 20, 20, "Factory", "st_a4_factory", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (21, 21, 21, "Core Access", "st_a4_core_access", "time", 5, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (22, 22, 22, "Finale", "st_a4_finale", "time", 5, 0, 0);
--INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (23, 23, 23, "Advanced Tramride", "sp_a1_tramride", "time", 6, 1, 0);
--INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (24, 24, 24, "Advanced Mel Intro", "sp_a1_mel_intro", "time", 6, 1, 0);
--INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (25, 25, 25, "Advanced Lift", "sp_a1_lift", "time", 6, 1, 0);
--INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (26, 26, 26, "Advanced Garden", "sp_a1_garden", "time", 6, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (27, 27, 27, "Advanced Destroyed Garden", "sp_a2_garden_de", "time", 7, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (28, 28, 28, "Advanced Underbounce", "sp_a2_underbounce", "time", 7, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (29, 29, 29, "Advanced Once Upon", "sp_a2_once_upon", "time", 7, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (30, 30, 30, "Advanced Past Power", "sp_a2_past_power", "time", 7, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (31, 31, 31, "Advanced Ramp", "sp_a2_ramp", "time", 7, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (32, 32, 32, "Advanced Firestorm", "sp_a2_firestorm", "time", 7, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (33, 33, 33, "Advanced Junkyard", "sp_a3_junkyard", "time", 8, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (34, 34, 34, "Advanced Concepts", "sp_a3_concepts", "time", 8, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (35, 35, 35, "Advanced Paint Fling", "sp_a3_paint_fling", "time", 8, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (36, 36, 36, "Advanced Faith Plate", "sp_a3_faith_plate", "time", 8, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (37, 37, 37, "Advanced Transition", "sp_a3_transition", "time", 8, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (38, 38, 38, "Advanced Overgrown", "sp_a4_overgrown", "time", 9, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (39, 39, 39, "Advanced Funnel Over Goo", "sp_a4_tb_over_goo", "time", 9, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (40, 40, 40, "Advanced Two Of A Kind", "sp_a4_two_of_a_kind", "time", 9, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (41, 41, 41, "Advanced Destroyed", "sp_a4_destroyed", "time", 9, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (42, 42, 42, "Advanced Factory", "sp_a4_factory", "time", 9, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (43, 43, 43, "Advanced Core Access", "sp_a4_core_access", "time", 10, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (44, 44, 44, "Advanced Finale", "sp_a4_finale", "time", 10, 1, 0);

DELETE FROM evidence_requirements;

INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (1 ,80, 1, 0, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (2 ,100, 1, 1, 0, '2021-08-01 00:00:01', '2021-11-27 23:19:34');
INSERT INTO evidence_requirements (`id`, `rank`, `demo`, `video`, `active`, `timestamp`, `closed_timestamp`) VALUES (3 ,200, 1, 0, 1, '2021-11-27 23:18:38', NULL);
