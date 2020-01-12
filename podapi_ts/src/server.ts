import "dotenv/config";
import App from "./App";
import HealthController from "./Features/Health/HealthController";

const app = new App([new HealthController()]);

app.listen();
