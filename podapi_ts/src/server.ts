import "dotenv/config";
import App from "./app";
import HealthController from "./features/health/healthController";

const app = new App([new HealthController()]);

app.listen();
