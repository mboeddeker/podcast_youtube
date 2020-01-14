import { JsonProperty } from "json-object-mapper";

class ReleaseDateDTO {
  @JsonProperty({ name: "#text" })
  public text: string = undefined;

  @JsonProperty({ name: "@_label" })
  public label: string = undefined;
}

export default ReleaseDateDTO;
