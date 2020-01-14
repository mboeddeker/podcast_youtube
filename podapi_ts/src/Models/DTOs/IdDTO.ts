import { JsonIgnore, JsonProperty } from "json-object-mapper";

class IdDTO {
  @JsonProperty({ name: "#text" })
  public text: string = undefined;

  @JsonProperty({ name: "@_id" })
  public id: string = undefined;
}

export default IdDTO;
