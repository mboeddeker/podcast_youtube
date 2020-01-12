import BaseServie from "./BaseService";
import ChartsResponse from "Models/ChartResponse";
import * as request from "request";

class ITunesService extends BaseServie {
  async getTopPodcasts(
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
    console.log(url);
    request.get(url, (error, response, body) => {
      if (error != null) {
        return new Promise<ChartsResponse>((resolve, reject) =>
          reject(`error: ${error}`)
        );
      }

      return new Promise<any>((resolve, _) => resolve(body));
    });
  }
}

export default ITunesService;
