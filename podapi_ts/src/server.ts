import "dotenv/config";
import App from "./App";
import ChartsController from "./Controller/ChartsController";
import HealthController from "./Controller/HealthController";
import SearchController from "./Controller/SearchController";
import FeedController from "./Controller/FeedController";

const app = new App([
  new HealthController(),
  new ChartsController(),
  new SearchController(),
  new FeedController()
]);

app.listen();
