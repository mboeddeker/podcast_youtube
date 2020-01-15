import { JsonProperty } from "json-object-mapper";
import FeedImageDTO from "./FeedImageDTO";
import ItemDTO from "./ItemDTO";
import ItunesOwnerDTO from "./ITunesOwnerDTO";

class ChannelDTO {
  @JsonProperty()
  public title: string = undefined;

  @JsonProperty()
  public lastBuildDate: string = undefined;

  @JsonProperty()
  public description: string = undefined;

  @JsonProperty({ type: FeedImageDTO })
  public image: FeedImageDTO = undefined;

  @JsonProperty({ name: "itunes:owner", type: ItunesOwnerDTO })
  public owner: ItunesOwnerDTO = undefined;

  @JsonProperty({ type: ItemDTO })
  public item: ItemDTO[] = undefined;
}

export default ChannelDTO;
