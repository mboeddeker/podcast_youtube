import { JsonProperty, ObjectMapper } from "json-object-mapper";
import { ChartItem } from "./ChartItem";
import FeedResponseDTO from "./DTOs/FeedResponseDTO";
import Model from "./Model";

/**
 * Interface ChartsResponse
 * props:
 *  - entries: [[ChartItem]]
 */
// tslint:disable-next-line:interface-name
export interface IChartsResponse {
  entries: ChartItem[];
}

/**
 * ### ChartResponse
 * Extending Model and [[IChartsResponse]]
 */
export class ChartResponse extends Model<FeedResponseDTO>
  implements IChartsResponse {
  @JsonProperty({ type: ChartItem })
  public entries: ChartItem[];

  constructor(dto: FeedResponseDTO) {
    super(dto);
  }

  public mapFromDTO(dto: FeedResponseDTO): void {
    this.entries = dto.feed.entry.map(entryDTO => new ChartItem(entryDTO));
  }
}
