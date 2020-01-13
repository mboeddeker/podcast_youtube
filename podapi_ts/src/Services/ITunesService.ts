import * as request from "request";
import ChartsResponse from "../Models/ChartResponse";
import BaseServie from "./BaseService";

class ITunesService extends BaseServie {
  public async getTopPodcasts(
    langauge: string = "de",
    limit: number = 30,
    explicit: boolean = true,
    genre?: string,
    withLookup: boolean = true
  ): Promise<any> {
    const url =
      genre == null
        ? `${this.baseUrl}${langauge}/rss/toppodcasts/limit=${limit}/explicit=${explicit}/xml`
        : `${this.baseUrl}${langauge}/rss/toppodcasts/limit=${limit}/genre=${genre}/explicit=${explicit}/xml`;

    return new Promise<any>((resolve, reject) => {
      request.get(url, (error, response, body) => {
        if (error != null) {
          reject(`error: ${error}`);
        }

        resolve(body);
      });
    });
  }
}

export default ITunesService;
