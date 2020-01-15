import { JsonProperty } from "json-object-mapper";

class MediaUrlDTO {
  @JsonProperty({ name: "@_url" })
  public url: string = undefined;

  @JsonProperty({ name: "@_type" })
  public type: string = undefined;

  @JsonProperty({ name: "@_length" })
  public length: number = undefined;
}

export default MediaUrlDTO;
