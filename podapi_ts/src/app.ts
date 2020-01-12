import * as bodyParser from "body-parser";
import * as cookieParser from "cookie-parser";
import * as express from "express";

import Controller from "./interfaces/controllerInterface";
import errorMiddleware from "./middleware/errorMiddleware";
import loggerMiddleware from "./middleware/loggerMiddleware";

class App {
  public app: express.Application;

  constructor(controller: Controller[]) {
    this.app = express();
    this.initializeMiddleware();
    this.initializeErrorhandling();
    this.initializeControllers(controller);
  }

  public listen() {
    this.app.listen(process.env.PORT, () => {
      console.log(`App listening on port ${process.env.PORT}`);
    });
  }

  public getServer() {
    return this.app;
  }

  private initializeMiddleware() {
    this.app.use(bodyParser.json());
    this.app.use(cookieParser());
    this.app.use(loggerMiddleware);
  }

  private initializeErrorhandling() {
    this.app.use(errorMiddleware);
  }

  private initializeControllers(controllers: Controller[]) {
    controllers.forEach(controller => {
      this.app.use("/", controller.router);
    });
  }
  /*
  private connectToTheDatabase() {
    const {
      MONGO_USER,
      MONGO_PASSWORD,
      MONGO_PATH,
    } = process.env;
    mongoose.connect(`mongodb://${MONGO_USER}:${MONGO_PASSWORD}${MONGO_PATH}`);
  } */
}

export default App;
