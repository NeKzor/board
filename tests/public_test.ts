import { assert, assertEquals } from "jsr:@std/assert";

const API = "https://board.portal2.local";
const PROFILE = "76561198049848090";

Deno.test("Changelog", async () => {
  const res = await fetch(`${API}/changelog/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Changelog with parameters", async () => {
  const res = await fetch(
    `${API}/changelog/json?profileNumber=${PROFILE}&startDate=2024-06-01&endDate=2024-06-03&startRank=1&endRank=10`,
  );

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Chamber", async () => {
  const res = await fetch(`${API}/chamber/1/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");

  assert(Object.keys(json).length);
});

Deno.test("Profile", async () => {
  const res = await fetch(`${API}/profile/${PROFILE}/json`);

  assertEquals(res.status, 200);

  const profile = await res.json();
  assert(typeof profile === "object");

  assert(profile.points);
  assert(profile.times);
  assert(profile.times.SP);
  assert(profile.times.COOP);
  assertEquals(profile.times.global, null);
  assertEquals(profile.times.chapters, undefined);
  assert(profile.userData);

  assertEquals(profile.profileNumber, "76561198049848090");
  assertEquals(profile.isRegistered, null);
  assertEquals(profile.hasRecords, null);
  assertEquals(profile.userData.displayName, "NeKz");
  assertEquals(profile.userData.profile_number, "76561198049848090");
  assertEquals(profile.userData.boardname, "NeKz");
  assertEquals(profile.userData.steamname, "NeKz");
  assertEquals(profile.userData.banned, 0);
  assertEquals(profile.userData.registered, 0);
  assertEquals(
    profile.userData.avatar,
    "https://avatars.steamstatic.com/9a86e6554aee395b3ac37d96a808335363eb79ff_full.jpg",
  );
  assertEquals(profile.userData.twitch, "NeKzor");
  assertEquals(profile.userData.youtube, "/@NeKz");
  assertEquals(profile.userData.title, null);
  assertEquals(profile.userData.admin, 1);
  assertEquals(profile.userData.donation_amount, null);
});

Deno.test("Aggregated overall", async () => {
  const res = await fetch(`${API}/aggregated/overall/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Aggregated single player", async () => {
  const res = await fetch(`${API}/aggregated/overall/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Aggregated by chapter", async () => {
  const res = await fetch(`${API}/aggregated/chapter/1/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Donators", async () => {
  const res = await fetch(`${API}/donators/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Wall of Shame", async () => {
  const res = await fetch(`${API}/wallofshame/json`);

  assertEquals(res.status, 200);

  const json = await res.json();
  assert(typeof json === "object");
});

Deno.test("Fetch new chamber scores", async () => {
  const body = new FormData();
  body.append("chamber", "47458");

  const res = await fetch(`${API}/fetchNewChamberScores`, {
    method: "POST",
  });

  assertEquals(res.status, 200);

  await res.body?.cancel();
});
