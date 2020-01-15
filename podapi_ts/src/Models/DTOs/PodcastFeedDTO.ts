import { JsonProperty } from "json-object-mapper";
import RssDTO from "./RssDTO";

class PodcastFeedDTO {
  @JsonProperty({ type: RssDTO })
  public rss: RssDTO = undefined;
}

export default PodcastFeedDTO;
