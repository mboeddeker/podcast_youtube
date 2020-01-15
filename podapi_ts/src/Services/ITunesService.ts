import * as xmlParser from "fast-xml-parser";
import { ObjectMapper } from "json-object-mapper";
import * as request from "request-promise";
import { ChartResponse } from "../Models/ChartResponse";
import FeedResponseDTO from "../Models/DTOs/FeedResponseDTO";
import LookupResponseDTO from "../Models/DTOs/LookupResponseDTO";
import { LookupResponse } from "../Models/LookupResponse";
import BaseService from "./BaseService";

/**
 * ### ITunesService
 * Fetching Podcasts and Lookups from the iTunes Api
 */
class ITunesService extends BaseService {
  /**
   *
   * @param langauge Language Code, eg. 'us', 'de' and so on. Default value `'de'`.
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
      request
        .get(url)
        .then((response: string) => {
          const jsonFromXml = xmlParser.parse(response, {
            ignoreAttributes: false,
            ignoreNameSpace: true
          });

          const feedResponse = ObjectMapper.deserialize(
            FeedResponseDTO,
            jsonFromXml
          );

          return new ChartResponse(feedResponse);
        })
        .then(async chartResponse => {
          if (withLookup) {
            // tslint:disable-next-line: prefer-array-literal
            const promises: Array<Promise<LookupResponse>> = [];

            chartResponse.entries.forEach(entry => {
              promises.push(this.getLookup(entry.id));
            });

            const lookups = await Promise.all(promises);

            chartResponse.entries.forEach(entry => {
              entry.lookup = lookups.find(
                lu => lu.results[0].trackId === Number(entry.id)
              ).results[0];
            });

            return chartResponse;
          } else {
            return chartResponse;
          }
        })
        .then(lookupedResponse => {
          resolve(lookupedResponse);
        })
        .catch(error => {
          return reject(`error: ${error}`);
        });
    });
  }

  public async getLookup(id: string): Promise<LookupResponse> {
    const url = `${this.baseUrl}lookup?id=${id}`;
    return new Promise<LookupResponse>((resolve, reject) => {
      request.get(url, (error, response, body) => {
        if (error != null || response.statusCode === 400) {
          return reject(`error: ${error ?? "Status: " + response.statusCode}`);
        }

        const lookupResponse = ObjectMapper.deserialize(
          LookupResponseDTO,
          JSON.parse(body)
        );

        return resolve(new LookupResponse(lookupResponse));
      });
    });
  }

  public async search(
    searchTerm: string,
    country: string,
    explicit: boolean
  ): Promise<LookupResponse> {
    const url = `${this.baseUrl}search?term=${searchTerm}&country=${country}&media=podcast&explicit=${explicit}`;
    return new Promise<LookupResponse>((resolve, reject) => {
      request.get(url, (error, response, body) => {
        if (error != null || response.statusCode === 400) {
          return reject(`error: ${error ?? "Status: " + response.statusCode}`);
        }

        const lookupResponse = ObjectMapper.deserialize(
          LookupResponseDTO,
          JSON.parse(body)
        );

        return resolve(new LookupResponse(lookupResponse));
      });
    });
  }
}

export default ITunesService;
