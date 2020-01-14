import { JsonProperty } from "json-object-mapper";

class ArtistDTO {
  @JsonProperty({ name: "#text" })
  public text: string = undefined;
}

export default ArtistDTO;
