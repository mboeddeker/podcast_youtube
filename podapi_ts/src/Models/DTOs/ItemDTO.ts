import { JsonProperty } from "json-object-mapper";

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
  public guid: string = undefined;

  @JsonProperty({ name: "itunes:episode" })
  public expisode: number = undefined;

  @JsonProperty({ name: "itunes:subtitle" })
  public subTitle: string = undefined;

  @JsonProperty({ name: "itunes:summary" })
  public summary: string = undefined;

  @JsonProperty({ name: "enclosure" })
  public mediaUrl: string = undefined;
}

export default ItemDTO;
