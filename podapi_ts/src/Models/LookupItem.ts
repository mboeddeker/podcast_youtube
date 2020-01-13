// tslint:disable-next-line:interface-name
export default interface ILookupItem {
  trackId: number;
  artistName: string;
  trackName: string;
  feedUrl: string;
  artwork100: string;
  artwork600: string;
  releaseDate: string;
  genres: string[];
  genreIds: string[];
}
