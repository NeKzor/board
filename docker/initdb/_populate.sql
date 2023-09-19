USE iverborg_leaderboard;

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
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (5, 5, 5, "Garden De", "st_a2_garden_de", "time", 2, 0, 0);
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
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (17, 17, 17, "Tb Over Goo", "st_a4_tb_over_goo", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (18, 18, 18, "Two Of A Kind", "st_a4_two_of_a_kind", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (19, 19, 19, "Destroyed", "st_a4_destroyed", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (20, 20, 20, "Factory", "st_a4_factory", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (21, 21, 21, "Core Access", "st_a4_core_access", "time", 5, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (22, 22, 22, "Finale", "st_a4_finale", "time", 5, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (23, 23, 23, "Tramride", "sp_a1_tramride", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (24, 24, 24, "Mel Intro", "sp_a1_mel_intro", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (25, 25, 25, "Lift", "sp_a1_lift", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (26, 26, 26, "Garden", "sp_a1_garden", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (27, 27, 27, "Garden De", "sp_a2_garden_de", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (28, 28, 28, "Underbounce", "sp_a2_underbounce", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (29, 29, 29, "Once Upon", "sp_a2_once_upon", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (30, 30, 30, "Past Power", "sp_a2_past_power", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (31, 31, 31, "Ramp", "sp_a2_ramp", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (32, 32, 32, "Firestorm", "sp_a2_firestorm", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (33, 33, 33, "Junkyard", "sp_a3_junkyard", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (34, 34, 34, "Concepts", "sp_a3_concepts", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (35, 35, 35, "Paint Fling", "sp_a3_paint_fling", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (36, 36, 36, "Faith Plate", "sp_a3_faith_plate", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (37, 37, 37, "Transition", "sp_a3_transition", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (38, 38, 38, "Overgrown", "sp_a4_overgrown", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (39, 39, 39, "Tb Over Goo", "sp_a4_tb_over_goo", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (40, 40, 40, "Two Of A Kind", "sp_a4_two_of_a_kind", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (41, 41, 41, "Destroyed", "sp_a4_destroyed", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (42, 42, 42, "Factory", "sp_a4_factory", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (43, 43, 43, "Core Access", "sp_a4_core_access", "time", 5 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `level_name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (44, 44, 44, "Finale", "sp_a4_finale", "time", 4, 5, 0);
