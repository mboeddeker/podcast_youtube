import { ObjectMapper } from "json-object-mapper";
import "reflect-metadata";
import IChartsResponse, { ChartResponse } from "../../src/Models/ChartResponse";
import FeedResponseDTO from "../../src/Models/DTOs/FeedResponseDTO";
// @ts-ignore
import feedJson from "../../testfiles/feed.json";
import { isNullOrUndefined } from "util";

test("Test correct Mapping from DTO to Model", () => {
  // given
  const feedResponse: FeedResponseDTO = ObjectMapper.deserialize(
    FeedResponseDTO,
    feedJson
  );

  // when
  const sut = new ChartResponse(feedResponse);

  // then
  expect(sut.entries.length).toBe(30);
  expect(sut.entries[0].title).toBe(feedJson.feed.entry[0].title);
});

test("Model to Json", () => {
  // given
  const feedResponse: FeedResponseDTO = ObjectMapper.deserialize(
    FeedResponseDTO,
    feedJson
  );

  // when
  const model = new ChartResponse(feedResponse);
  const sut = model.toJson() as IChartsResponse;

  // then
  expect(isNullOrUndefined(sut)).toBeFalsy();
  expect(isNullOrUndefined(sut.entries)).toBeFalsy();
  expect(isNullOrUndefined(sut.entries[0].title)).toBeFalsy();
  expect(isNullOrUndefined(sut.entries[0].summary)).toBeFalsy();
  expect(isNullOrUndefined(sut.entries[0].artist)).toBeFalsy();
});
