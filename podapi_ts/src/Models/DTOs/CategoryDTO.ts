import { JsonProperty } from "json-object-mapper";

class CategoryDTO {
  @JsonProperty({ name: "@_id" })
  public id: string = undefined;

  @JsonProperty({ name: "@_term" })
  public term: string = undefined;

  @JsonProperty({ name: "@_label" })
  public label: string = undefined;
}

export default CategoryDTO;
