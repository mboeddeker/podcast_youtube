import "dotenv/config";
import App from "./app";
import HealthController from "./Controller/HealthController";

const app = new App([new HealthController()]);

app.listen();
