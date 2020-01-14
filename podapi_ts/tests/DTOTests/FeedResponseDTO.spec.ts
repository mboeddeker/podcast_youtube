import { ObjectMapper } from "json-object-mapper";
import "reflect-metadata";
import { isNull } from "util";
import FeedResponseDTO from "../../src/Models/DTOs/FeedResponseDTO";
// @ts-ignore
import feedJson from "../../testfiles/feed.json";

test("Importing Json File works", () => {
  expect(!isNull(feedJson));
  expect(!isNull(feedJson.feed));
  expect(feedJson.feed.title).toBe("iTunes Store: Top-Podcasts");
});

test("Test json mapping for feedDTO", () => {
  const mappedObject: FeedResponseDTO = ObjectMapper.deserialize(
    FeedResponseDTO,
    feedJson
  );

  expect(isNull(mappedObject)).toBe(false);
  expect(mappedObject.feed.lang === "de");
});
