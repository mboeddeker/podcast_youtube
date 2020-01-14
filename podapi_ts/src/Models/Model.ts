import { ObjectMapper } from "json-object-mapper";

abstract class Model<T> {
  constructor(dto: T) {
    this.mapFromDTO(dto);
  }

  public abstract mapFromDTO(dto: T): void;

  public toJson(): object {
    return JSON.parse(ObjectMapper.serialize(this).toString());
  }
}

export default Model;
