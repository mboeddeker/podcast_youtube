import { JsonProperty } from "json-object-mapper";

class GuidDTO {
  @JsonProperty({ name: "#text" })
  public text: string = undefined;
}

export default GuidDTO;
