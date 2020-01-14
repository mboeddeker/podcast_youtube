import { ObjectMapper } from "json-object-mapper";
import "reflect-metadata";
import { isNullOrUndefined } from "util";
import { ChartItem } from "../../src/Models/ChartItem";
import FeedResponseDTO from "../../src/Models/DTOs/FeedResponseDTO";
// @ts-ignore
import feedJson from "../../testfiles/feed.json";

test("Test correct Mapping from DTO to Model", () => {
  // given
  const feedResponse: FeedResponseDTO = ObjectMapper.deserialize(
    FeedResponseDTO,
    feedJson
  );

  // when
  const sut = new ChartItem(feedResponse.feed.entry[0]);

  // then
  expect(isNullOrUndefined(sut.title)).toBe(false);
});
