import { NextFunction, Request, Response } from "express";

function loggerMiddleware(
  request: Request,
  response: Response,
  next: NextFunction
) {
  console.log(
    `${request.method}: ${request.statusCode}   Path: ${request.path}`
  );
  next();
}

export default loggerMiddleware;
