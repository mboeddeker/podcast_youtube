import { JsonProperty } from "json-object-mapper";

class ContentDTO {
  @JsonProperty({ name: "#text" })
  public text: string = undefined;

  @JsonProperty({ name: "@_type" })
  public type: string = undefined;
}

export default ContentDTO;
