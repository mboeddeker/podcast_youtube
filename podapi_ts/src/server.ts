import "dotenv/config";
import App from "./App";
import ChartsController from "./Controller/ChartsController";
import HealthController from "./Controller/HealthController";

const app = new App([new HealthController(), new ChartsController()]);

app.listen();
