import { JsonProperty } from "json-object-mapper";

class ItunesOwnerDTO {
  @JsonProperty({ name: "itunes:name" })
  public name: string = undefined;

  @JsonProperty({ name: "itunes:email" })
  public email: string = undefined;
}

export default ItunesOwnerDTO;
