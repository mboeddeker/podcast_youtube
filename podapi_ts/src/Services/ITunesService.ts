import * as xmlParser from "fast-xml-parser";
import { ObjectMapper } from "json-object-mapper";
import * as request from "request";
import { ChartResponse } from "../Models/ChartResponse";
import FeedResponseDTO from "../Models/DTOs/FeedResponseDTO";
import BaseServie from "./BaseService";

/**
 * ### ITunesService
 * Fetching Podcasts and Lookups from the iTunes Api
 */
class ITunesService extends BaseServie {
  /**
   *
   * @param langauge Language Code, eg. 'us', 'de' and so on. Default value `'30'`.
   * @param limit Limit of entries. Maximum 200, minimum 1. Default value `30`.
   * @param explicit Explicit entries allowed. Default value `true`
   * @param genre Get entries for genre with genre id. Default value `null`.
   * @param withLookup Get Lookup for more details and direct link to rss file. Default value `false`.
   *
   * @return Returning a Promise with [[ChartResponse]]
   */
  public async getTopPodcasts(
    langauge: string = "de",
    limit: number = 30,
    explicit: boolean = true,
    genre?: string,
    withLookup: boolean = true
  ): Promise<ChartResponse> {
    const url =
      genre == null
        ? `${this.baseUrl}${langauge}/rss/toppodcasts/limit=${limit}/explicit=${explicit}/xml`
        : `${this.baseUrl}${langauge}/rss/toppodcasts/limit=${limit}/genre=${genre}/explicit=${explicit}/xml`;

    return new Promise<ChartResponse>((resolve, reject) => {
      request.get(url, (error, response, body) => {
        if (error != null || response.statusCode === 400) {
          return reject(`error: ${error ?? "Status: " + response.statusCode}`);
        }

        const jsonFromXml = xmlParser.parse(body, {
          ignoreAttributes: false,
          ignoreNameSpace: true
        });

        const feedResponse = ObjectMapper.deserialize(
          FeedResponseDTO,
          jsonFromXml
        );

        return resolve(new ChartResponse(feedResponse));
      });
    });
  }
}

export default ITunesService;
