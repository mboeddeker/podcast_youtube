import HttpException from "exceptions/httpException";
import { NextFunction, Request, Response } from "express";

function errorMiddleware(
  error: HttpException,
  request: Request,
  response: Response,
  next: NextFunction
) {
  const status = error.status || 500;
  const message = error.message || "Something went wrong";

  response.status(status).send({ message, status });
}

export default errorMiddleware;
