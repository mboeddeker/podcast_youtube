import { JsonProperty } from "json-object-mapper";

class AuthorDTO {
  @JsonProperty()
  public name: string = undefined;

  @JsonProperty()
  public uri: string = undefined;
}

export default AuthorDTO;
