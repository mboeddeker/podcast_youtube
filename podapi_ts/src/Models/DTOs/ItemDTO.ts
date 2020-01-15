import { JsonProperty } from "json-object-mapper";
import GuidDTO from "./GuidDTO";
import MediaUrlDTO from "./MediaUrlDTO";

class ItemDTO {
  @JsonProperty()
  public title: string = undefined;

  @JsonProperty()
  public description: string = undefined;

  @JsonProperty()
  public pubDate: string = undefined;

  @JsonProperty()
  public link: string = undefined;

  @JsonProperty()
  public guid: GuidDTO = undefined;

  @JsonProperty({ name: "itunes:episode" })
  public expisode: number = undefined;

  @JsonProperty({ name: "itunes:subtitle" })
  public subTitle: string = undefined;

  @JsonProperty({ name: "itunes:summary" })
  public summary: string = undefined;

  @JsonProperty({ name: "enclosure", type: MediaUrlDTO })
  public mediaUrl: MediaUrlDTO = undefined;
}

export default ItemDTO;
