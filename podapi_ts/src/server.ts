import "dotenv/config";
import App from "./App";
import HealthController from "./Controller/HealthController";

const app = new App([new HealthController()]);

app.listen();
