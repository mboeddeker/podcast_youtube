import { ObjectMapper } from "json-object-mapper";
import "reflect-metadata";
import { isNull, isNullOrUndefined } from "util";
import FeedDTO from "../../src/Models/DTOs/FeedDTO";
// @ts-ignore
import feedJson from "../../testfiles/feed.json";

test("FeedDTO Mapping okay and not undefined", () => {
  const sut = ObjectMapper.deserialize(FeedDTO, feedJson.feed);
  expect(isNullOrUndefined(sut.id)).toBeFalsy();
  expect(isNullOrUndefined(sut.author)).toBeFalsy();
  expect(isNullOrUndefined(sut.lang)).toBeFalsy();
  expect(isNullOrUndefined(sut.entry)).toBeFalsy();
  expect(isNullOrUndefined(sut.rights)).toBeFalsy();
  expect(isNullOrUndefined(sut.updated)).toBeFalsy();
  expect(isNullOrUndefined(sut.icon)).toBeFalsy();

  expect(sut.entry.length).toBe(30);
});

test("FeedDTO Mapping okay with values", () => {
  const sut = ObjectMapper.deserialize(FeedDTO, feedJson.feed);
  expect(sut.id).toBe(
    "https://itunes.apple.com/de/rss/toppodcasts/limit=30/explicit=true/xml"
  );
  expect(sut.author.name).toBe("iTunes Store");
  expect(sut.icon).toBe("http://itunes.apple.com/favicon.ico");
  expect(sut.lang).toBe("de");
});
