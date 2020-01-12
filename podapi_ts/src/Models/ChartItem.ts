import LookupItem from "./LookupItem";

export default interface ChartItem {
  id: string;
  title: string;
  summary: string;
  artist: string;
  thumbnail: string;
  releaseDate: string;
  category: string;
  lookup: LookupItem;
}
