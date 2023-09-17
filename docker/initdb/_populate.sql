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

INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (1, 1, 1, "st_a1_tramride", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (2, 2, 2, "st_a1_mel_intro", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (3, 3, 3, "st_a1_lift", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (4, 4, 4, "st_a1_garden", "time", 1, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (5, 5, 5, "st_a2_garden_de", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (6, 6, 6, "st_a2_underbounce", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (7, 7, 7, "st_a2_once_upon", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (8, 8, 8, "st_a2_past_power", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (9, 9, 9, "st_a2_ramp", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (10, 10, 10, "st_a2_firestorm", "time", 2, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (11, 11, 11, "st_a3_junkyard", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (12, 12, 12, "st_a3_concepts", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (13, 13, 13, "st_a3_paint_fling", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (14, 14, 14, "st_a3_faith_plate", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (15, 15, 15, "st_a3_transition", "time", 3, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (16, 16, 16, "st_a4_overgrown", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (17, 17, 17, "st_a4_tb_over_goo", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (18, 18, 18, "st_a4_two_of_a_kind", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (19, 19, 19, "st_a4_destroyed", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (20, 20, 20, "st_a4_factory", "time", 4, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (21, 21, 21, "st_a4_core_access", "time", 5, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (22, 22, 22, "st_a4_finale", "time", 5, 0, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (23, 23, 23, "sp_a1_tramride", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (24, 24, 24, "sp_a1_mel_intro", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (25, 25, 25, "sp_a1_lift", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (26, 26, 26, "sp_a1_garden", "time", 1 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (27, 27, 27, "sp_a2_garden_de", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (28, 28, 28, "sp_a2_underbounce", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (29, 29, 29, "sp_a2_once_upon", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (30, 30, 30, "sp_a2_past_power", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (31, 31, 31, "sp_a2_ramp", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (32, 32, 32, "sp_a2_firestorm", "time", 2 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (33, 33, 33, "sp_a3_junkyard", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (34, 34, 34, "sp_a3_concepts", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (35, 35, 35, "sp_a3_paint_fling", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (36, 36, 36, "sp_a3_faith_plate", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (37, 37, 37, "sp_a3_transition", "time", 3 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (38, 38, 38, "sp_a4_overgrown", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (39, 39, 39, "sp_a4_tb_over_goo", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (40, 40, 40, "sp_a4_two_of_a_kind", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (41, 41, 41, "sp_a4_destroyed", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (42, 42, 42, "sp_a4_factory", "time", 4 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (43, 43, 43, "sp_a4_core_access", "time", 5 + 5, 1, 0);
INSERT INTO maps (`id`, `steam_id`, `lp_id`, `name`, `type`, `chapter_id`, `is_coop`, `is_public`) VALUES (44, 44, 44, "sp_a4_finale", "time", 4, 5, 0);
