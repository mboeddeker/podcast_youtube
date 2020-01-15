import * as xmlParser from "fast-xml-parser";
import { ObjectMapper } from "json-object-mapper";
import request = require("request");
import PodcastFeedDTO from "../Models/DTOs/PodcastFeedDTO";
import { PodcastFeed } from "../Models/PodcastFeed";
import BaseService from "./BaseService";

class FeedService extends BaseService {
  public async getFeed(feedUrl: string): Promise<PodcastFeed> {
    return new Promise<PodcastFeed>((resolve, reject) => {
      request.get(feedUrl, (error, response, body) => {
        if (error != null || response.statusCode === 400) {
          return reject(`error: ${error ?? "Status: " + response.statusCode}`);
        }

        const jsonFromXml = xmlParser.parse(body, {
          ignoreAttributes: false,
          trimValues: true,
          parseNodeValue: true
        });

        const feedResponse = ObjectMapper.deserialize(
          PodcastFeedDTO,
          jsonFromXml
        );

        return resolve(new PodcastFeed(feedResponse));
      });
    });
  }
}

export default FeedService;
